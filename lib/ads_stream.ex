defmodule GRPC.XDS.ADS.Stream do
  @moduledoc false
  alias GRPC.XDS.ADS.{Request, Response, TypeMap}

  def lookup(channel, services, opts) do
    run(channel, opts, fn state ->
      {addresses, _state} = Enum.map_reduce(services, state, &service_addresses/2)
      addresses |> List.flatten() |> Enum.uniq()
    end)
  end

  def fetch(channel, type, names, opts) do
    if TypeMap.type_atom_to_type_url(type) do
      run(channel, opts, fn state ->
        {resources, _state} =
          Enum.map_reduce(names, state, fn name, state ->
            {resource, state} = resource(state, type, name)
            {{name, resource}, state}
          end)

        {:ok, Map.new(resources)}
      end)
    else
      {:error, {:unsupported_resource_type, type}}
    end
  end

  defp run(channel, opts, fun) do
    timeout = Keyword.get(opts, :timeout, 5_000)
    node = Request.xds_node(opts)

    stream =
      GRPC.XDS.ADS.Stub.stream_aggregated_resources(channel,
        timeout: timeout,
        metadata: Keyword.get(opts, :metadata, %{})
      )

    try do
      fun.(%{
        stream: stream,
        node: node,
        resources: %{},
        subscriptions: %{},
        versions: %{},
        nonces: %{},
        next: nil,
        timeout: timeout,
        deadline: System.monotonic_time(:millisecond) + timeout
      })
    rescue
      error in GRPC.RPCError -> {:error, error}
      _error in Protobuf.DecodeError -> {:error, :invalid_resource}
    catch
      {:xds_error, reason} -> {:error, reason}
      :exit, reason -> {:error, {:transport_exit, reason}}
    after
      GRPC.Stub.cancel(stream)
    end
  end

  defp resource(state, type, name) do
    case Map.fetch(state.resources, {type, name}) do
      {:ok, resource} ->
        {resource, state}

      :error ->
        names = Enum.uniq(Map.get(state.subscriptions, type, []) ++ [name])
        state = put_in(state.subscriptions[type], names)

        request =
          Request.discovery_request(type, names, Map.get(state.versions, type, ""),
            node: state.node,
            nonce: Map.get(state.nonces, type, "")
          )

        GRPC.Stub.send_request(state.stream, request)
        await_resource(state, type, name)
    end
  end

  defp await_resource(state, type, name) do
    if System.monotonic_time(:millisecond) >= state.deadline, do: fail(:timeout)
    {response, state} = receive_response(state)
    response_type = TypeMap.type_url_to_type_atom(response.type_url)

    unless Map.has_key?(state.subscriptions, response_type),
      do: fail({:unexpected_resource_type, response.type_url})

    parsed =
      try do
        unless Enum.all?(response.resources, &(&1.type_url == response.type_url)),
          do: raise(ArgumentError, "resource type does not match response type")

        Response.parse_response(response)
      rescue
        error ->
          nack =
            Request.discovery_request(
              response_type,
              state.subscriptions[response_type],
              Map.get(state.versions, response_type, ""),
              node: state.node,
              nonce: response.nonce
            )

          GRPC.Stub.send_request(state.stream, %{
            nack
            | error_detail: %Google.Rpc.Status{
                code: 3,
                message: Exception.message(error)
              }
          })

          fail({:invalid_resource, response.type_url})
      end

    ack =
      Request.discovery_request(
        response_type,
        state.subscriptions[response_type],
        response.version_info,
        node: state.node,
        nonce: response.nonce
      )

    GRPC.Stub.send_request(state.stream, ack)

    resources =
      if response_type in [:listener, :cluster] do
        Map.reject(state.resources, fn {{type, _}, _} -> type == response_type end)
      else
        state.resources
      end

    state = %{
      state
      | resources: Map.merge(resources, parsed),
        versions: Map.put(state.versions, response_type, response.version_info),
        nonces: Map.put(state.nonces, response_type, response.nonce)
    }

    case Map.fetch(state.resources, {type, name}) do
      {:ok, resource} ->
        {resource, state}

      :error when response_type == type and type in [:listener, :cluster] ->
        fail({:resource_not_found, type, name})

      :error ->
        await_resource(state, type, name)
    end
  end

  defp receive_response(%{next: nil} = state) do
    case GRPC.Stub.recv(state.stream, timeout: state.timeout) do
      {:ok, replies} -> consume(Enumerable.reduce(replies, {:cont, nil}, &suspend/2), state)
      {:error, reason} -> fail(reason)
    end
  end

  defp receive_response(state), do: consume(state.next.({:cont, nil}), state)
  defp suspend(reply, _acc), do: {:suspend, reply}
  defp consume({:suspended, {:ok, response}, next}, state), do: {response, %{state | next: next}}
  defp consume({:suspended, {:error, reason}, _}, _state), do: fail(reason)
  defp consume(_, _state), do: fail(:stream_closed)

  defp service_addresses(service, state) do
    {listener, state} = resource(state, :listener, service)

    route =
      case listener.api_listener do
        %{
          api_listener: %{
            type_url:
              "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager",
            value: value
          }
        } ->
          Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.decode(
            value
          ).route_specifier

        _ ->
          fail({:unsupported_listener, service})
      end

    {route, state} =
      case route do
        {:rds, rds} ->
          require_ads(rds.config_source)
          resource(state, :route_configuration, rds.route_config_name)

        _ ->
          fail({:unsupported_route, service})
      end

    cluster_names =
      case route.virtual_hosts do
        [%{routes: [%{action: {:route, action}}]}] ->
          case action.cluster_specifier do
            {:cluster, name} ->
              [name]

            _ ->
              fail({:unsupported_route, service})
          end

        _ ->
          fail({:ambiguous_routes, service})
      end

    Enum.map_reduce(cluster_names, state, &cluster_addresses/2)
  end

  defp cluster_addresses(name, state) do
    {cluster, state} = resource(state, :cluster, name)

    {assignment, state} =
      case cluster.cluster_discovery_type do
        {:type, :EDS} ->
          config = cluster.eds_cluster_config
          if is_nil(config), do: fail({:missing_eds_config, name})
          require_ads(config.eds_config)

          resource(
            state,
            :cluster_load_assignment,
            if(config.service_name == "", do: name, else: config.service_name)
          )

        _ ->
          fail({:unsupported_cluster_type, name})
      end

    {addresses(assignment), state}
  end

  # A URL selects a single ADS control plane; do not silently ignore references to other servers.
  defp require_ads(%{config_source_specifier: {:ads, _}}), do: :ok
  defp require_ads(_), do: fail(:unsupported_config_source)

  defp addresses(assignment) do
    case assignment.endpoints do
      [] ->
        []

      localities ->
        locality = Enum.max_by(localities, &weight(&1.load_balancing_weight))

        Enum.map(locality.lb_endpoints, fn endpoint ->
          case endpoint.host_identifier do
            {:endpoint,
             %{
               address: %{
                 address:
                   {:socket_address,
                    %{address: host, port_specifier: {:port_value, port}, protocol: :TCP}}
               }
             }} ->
              {host, port}

            _ ->
              fail(:unsupported_endpoint_address)
          end
        end)
    end
  end

  defp weight(nil), do: 1
  defp weight(%{value: value}), do: value
  defp fail(reason), do: throw({:xds_error, reason})
end
