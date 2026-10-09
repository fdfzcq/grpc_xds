defmodule GRPC.XDS.ADS do
  @moduledoc """
  Provider-independent, one-shot service discovery over xDS v3 ADS.

  Accepts an HTTP(S) control plane URL or `host:port`. Configure node identity
  with `:node_id`, `:node_cluster`, `:node_metadata`, or a complete `:node`.
  `:connect_options` are passed to gRPC (including `:cred` for TLS/mTLS),
  and `:metadata` is sent as gRPC request metadata. `:timeout` defaults to 5 seconds.
  Successful service lookups return addresses; failures return `{:error, reason}`.
  """

  def lookup_service_addresses(service) do
    case Application.get_env(:grpc_xds, :control_plane_url) ||
           Application.get_env(:grpc_xds, :control_plane_address) do
      nil -> {:error, :no_control_plane_address_set}
      url -> get_service_resource(url, service, Application.get_env(:grpc_xds, :options, []))
    end
  end

  def lookup_service_addresses(url, service, opts \\ []),
    do: get_service_resource(url, service, opts)

  def get_service_resource(url, service, opts \\ []) do
    with_channel(url, opts, fn channel -> get_resources(channel, [service], opts) end)
  end

  def get_resources(channel, resources, opts \\ []) do
    GRPC.XDS.ADS.Stream.lookup(channel, resources, opts)
  end

  @doc "Fetches named resources of an ADS type without interpreting service routing."
  def fetch_resources(url, type, names, opts \\ []) do
    with_channel(url, opts, fn channel ->
      GRPC.XDS.ADS.Stream.fetch(channel, type, names, opts)
    end)
  end

  defp with_channel(url, opts, fun) do
    with :ok <- validate_url(url),
         {:ok, channel} <- GRPC.Stub.connect(url, Keyword.get(opts, :connect_options, [])) do
      try do
        fun.(channel)
      after
        GRPC.Stub.disconnect(channel)
      end
    end
  end

  defp validate_url(url) when is_binary(url) do
    explicit_scheme? = String.contains?(url, "://")
    uri = URI.parse(if explicit_scheme?, do: url, else: "http://" <> url)
    valid_authority? = explicit_scheme? or Regex.match?(~r/:\d+$/, url)

    if valid_authority? and uri.scheme in ["http", "https"] and is_binary(uri.host) and
         uri.host != "" and
         is_integer(uri.port) and uri.port in 1..65535 and uri.path in [nil, "", "/"] and
         is_nil(uri.query) and is_nil(uri.fragment) and is_nil(uri.userinfo) do
      :ok
    else
      {:error, :invalid_control_plane_url}
    end
  rescue
    ArgumentError -> {:error, :invalid_control_plane_url}
  end

  defp validate_url(_), do: {:error, :invalid_control_plane_url}
end

defmodule GRPC.XDS.ADS.Service do
  use GRPC.Service, name: "envoy.service.discovery.v3.AggregatedDiscoveryService"

  rpc(
    :StreamAggregatedResources,
    stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
    stream(Envoy.Service.Discovery.V3.DiscoveryResponse)
  )
end

defmodule GRPC.XDS.ADS.Stub do
  use GRPC.Stub, service: GRPC.XDS.ADS.Service
end
