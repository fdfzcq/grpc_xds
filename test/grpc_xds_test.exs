defmodule GrpcXdsTest.ControlPlane do
  use GRPC.Server, service: GRPC.XDS.ADS.Service

  alias GRPC.XDS.ADS.TypeMap

  def stream_aggregated_resources(requests, materializer) do
    mode = Application.get_env(:grpc_xds, :test_mode, :normal)
    if mode == :rpc_error, do: raise(GRPC.RPCError, status: 7, message: "access denied")
    observer = Application.fetch_env!(:grpc_xds, :test_observer)
    stream_id = make_ref()
    send(observer, {:stream, stream_id, materializer.http_request_headers})

    requests
    |> Stream.transform(%{}, fn request, versions ->
      type = TypeMap.type_url_to_type_atom(request.type_url)
      send(observer, {:request, stream_id, type, request})

      if request.response_nonce != "" do
        unless {request.version_info, request.response_nonce} == Map.fetch!(versions, type),
          do: raise("incorrect ACK")

        {[], Map.put(versions, {:acked, type}, true)}
      else
        unless request.version_info == "", do: raise("initial version must be empty")

        previous =
          %{
            route_configuration: :listener,
            cluster: :route_configuration,
            cluster_load_assignment: :cluster
          }[type]

        if previous && Map.has_key?(versions, previous) && !versions[{:acked, previous}],
          do: raise("dependency was not ACKed on this stream")

        resources =
          case request.resource_names do
            ["missing"] -> []
            names -> [pack(adjust(type, resource(type, names), mode))]
          end

        response = %Envoy.Service.Discovery.V3.DiscoveryResponse{
          type_url: request.type_url,
          version_info: "version-#{type}",
          nonce: "nonce-#{type}",
          resources: resources
        }

        responses =
          case mode do
            :timeout ->
              []

            :interleaved when type == :route_configuration ->
              listener_response = %{
                response
                | type_url: TypeMap.type_atom_to_type_url(:listener),
                  version_info: "version-listener",
                  nonce: "nonce-listener",
                  resources: [pack(resource(:listener, ["service"]))]
              }

              [listener_response, response]

            _ ->
              [response]
          end

        {responses, Map.put(versions, type, {response.version_info, response.nonce})}
      end
    end)
    |> Stream.map(& &1)
    |> GRPC.Stream.from(max_demand: 1)
    |> GRPC.Stream.run_with(materializer)
  end

  defp pack(%module{} = message) do
    %Google.Protobuf.Any{
      type_url:
        case module do
          Envoy.Config.Listener.V3.Listener ->
            TypeMap.type_atom_to_type_url(:listener)

          Envoy.Config.Route.V3.RouteConfiguration ->
            TypeMap.type_atom_to_type_url(:route_configuration)

          Envoy.Config.Cluster.V3.Cluster ->
            TypeMap.type_atom_to_type_url(:cluster)

          Envoy.Config.Endpoint.V3.ClusterLoadAssignment ->
            TypeMap.type_atom_to_type_url(:cluster_load_assignment)

          _ ->
            "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager"
        end,
      value: module.encode(message)
    }
  end

  defp resource(:listener, ["service"]) do
    %Envoy.Config.Listener.V3.Listener{
      name: "service",
      api_listener: %Envoy.Config.Listener.V3.ApiListener{
        api_listener:
          pack(%Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager{
            route_specifier:
              {:rds,
               %Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.Rds{
                 route_config_name: "routes",
                 config_source: ads_config()
               }}
          })
      }
    }
  end

  defp resource(:route_configuration, ["routes"]) do
    %Envoy.Config.Route.V3.RouteConfiguration{
      name: "routes",
      virtual_hosts: [
        %Envoy.Config.Route.V3.VirtualHost{
          routes: [
            %Envoy.Config.Route.V3.Route{
              action:
                {:route,
                 %Envoy.Config.Route.V3.RouteAction{cluster_specifier: {:cluster, "cluster"}}}
            }
          ]
        }
      ]
    }
  end

  defp resource(:cluster, ["cluster"]) do
    %Envoy.Config.Cluster.V3.Cluster{
      name: "cluster",
      cluster_discovery_type: {:type, :EDS},
      eds_cluster_config: %Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig{
        service_name: "endpoints",
        eds_config: ads_config()
      }
    }
  end

  defp resource(:cluster_load_assignment, ["endpoints"]) do
    %Envoy.Config.Endpoint.V3.ClusterLoadAssignment{
      cluster_name: "endpoints",
      endpoints: [
        locality(1, [{"127.0.0.3", 9000}]),
        locality(10, [{"127.0.0.1", 8080}, {"127.0.0.2", 8081}])
      ]
    }
  end

  defp adjust(:route_configuration, config, :ambiguous) do
    %{config | virtual_hosts: config.virtual_hosts ++ config.virtual_hosts}
  end

  defp adjust(_, resource, _), do: resource

  defp ads_config do
    %Envoy.Config.Core.V3.ConfigSource{
      config_source_specifier: {:ads, %Envoy.Config.Core.V3.AggregatedConfigSource{}},
      resource_api_version: :V3
    }
  end

  defp locality(weight, addresses) do
    %Envoy.Config.Endpoint.V3.LocalityLbEndpoints{
      load_balancing_weight: %Google.Protobuf.UInt32Value{value: weight},
      lb_endpoints:
        Enum.map(addresses, fn {host, port} ->
          %Envoy.Config.Endpoint.V3.LbEndpoint{
            host_identifier:
              {:endpoint,
               %Envoy.Config.Endpoint.V3.Endpoint{
                 address: %Envoy.Config.Core.V3.Address{
                   address:
                     {:socket_address,
                      %Envoy.Config.Core.V3.SocketAddress{
                        address: host,
                        port_specifier: {:port_value, port}
                      }}
                 }
               }}
          }
        end)
    }
  end
end

defmodule GrpcXdsTest do
  use ExUnit.Case

  setup do
    previous = Application.get_all_env(:grpc_xds)
    for {key, _} <- previous, do: Application.delete_env(:grpc_xds, key)
    Application.put_env(:grpc_xds, :test_observer, self())

    on_exit(fn ->
      for {key, _} <- Application.get_all_env(:grpc_xds),
          do: Application.delete_env(:grpc_xds, key)

      for {key, value} <- previous, do: Application.put_env(:grpc_xds, key, value)
    end)

    :ok
  end

  setup do
    server = GrpcXdsTest.ControlPlane
    {:ok, _, port} = GRPC.Server.start(server, 0)
    on_exit(fn -> GRPC.Server.stop(server) end)
    %{url: "http://localhost:#{port}", address: "localhost:#{port}"}
  end

  test "discovers using a URL with no cloud configuration, one ADS stream and CDS indirection", %{
    url: url
  } do
    assert GRPC.XDS.ADS.lookup_service_addresses(url, "service") == [
             {"127.0.0.1", 8080},
             {"127.0.0.2", 8081}
           ]

    assert_receive {:stream, id, _}

    for type <- [:listener, :route_configuration, :cluster, :cluster_load_assignment] do
      assert_receive {:request, ^id, ^type,
                      %{version_info: "", response_nonce: "", node: %{id: "grpc-xds"}}}
    end

    for type <- [:listener, :route_configuration, :cluster] do
      assert_receive {:request, ^id, ^type, %{version_info: version, response_nonce: nonce}}
      assert version == "version-#{type}"
      assert nonce == "nonce-#{type}"
    end

    refute_receive {:stream, _, _}
  end

  test "accepts per-call node identity and authentication metadata", %{url: url} do
    assert [_ | _] =
             GRPC.XDS.ADS.get_service_resource(url, "service",
               node_id: "mesh-client",
               node_cluster: "payments",
               node_metadata: %{"region" => "eu"},
               metadata: %{"authorization" => "Bearer test-token"}
             )

    assert_receive {:stream, id, headers}
    assert headers["authorization"] == "Bearer test-token"
    assert_receive {:request, ^id, :listener, %{node: node}}
    assert node.id == "mesh-client"
    assert node.cluster == "payments"
    assert node.metadata.fields["region"].kind == {:string_value, "eu"}
  end

  test "supports configured URL and legacy host:port", %{url: url, address: address} do
    Application.put_env(:grpc_xds, :control_plane_url, url)
    assert [_ | _] = GRPC.XDS.ADS.lookup_service_addresses("service")
    assert [_ | _] = GRPC.XDS.ADS.get_service_resource(address, "service")
  end

  test "fetches typed resources without assuming a listener graph", %{url: url} do
    assert {:ok, %{"endpoints" => %{cluster_name: "endpoints"}}} =
             GRPC.XDS.ADS.fetch_resources(url, :cluster_load_assignment, ["endpoints"])
  end

  test "returns missing resources and unsupported types as errors", %{url: url} do
    assert {:error, {:resource_not_found, :listener, "missing"}} =
             GRPC.XDS.ADS.get_service_resource(url, "missing")

    assert {:error, {:unsupported_resource_type, :unknown}} =
             GRPC.XDS.ADS.fetch_resources(url, :unknown, ["x"])
  end

  test "uses HTTPS with a trusted control plane certificate" do
    server = GrpcXdsTest.ControlPlane
    GRPC.Server.stop(server)
    cert = Path.expand("fixtures/control_plane_cert.pem", __DIR__)
    key = Path.expand("fixtures/control_plane_key.pem", __DIR__)
    server_cred = GRPC.Credential.new(ssl: [certfile: cert, keyfile: key])
    {:ok, _, port} = GRPC.Server.start(server, 0, adapter_opts: [cred: server_cred])

    client_cred =
      GRPC.Credential.new(
        ssl: [
          cacertfile: Path.expand("fixtures/control_plane_ca.pem", __DIR__),
          verify: :verify_peer
        ]
      )

    assert [_ | _] =
             GRPC.XDS.ADS.get_service_resource("https://localhost:#{port}", "service",
               connect_options: [cred: client_cred]
             )
  end

  test "returns unsupported routing explicitly", %{url: url} do
    Application.put_env(:grpc_xds, :test_mode, :ambiguous)

    assert {:error, {:ambiguous_routes, "service"}} =
             GRPC.XDS.ADS.get_service_resource(url, "service")
  end

  @tag capture_log: true
  test "returns RPC failures and times out without crashing the caller", %{url: url} do
    Application.put_env(:grpc_xds, :test_mode, :rpc_error)
    assert {:error, %GRPC.RPCError{status: 7}} = GRPC.XDS.ADS.get_service_resource(url, "service")
    Application.put_env(:grpc_xds, :test_mode, :timeout)
    started = System.monotonic_time(:millisecond)

    assert {:error, %GRPC.RPCError{status: 4}} =
             GRPC.XDS.ADS.get_service_resource(url, "service", timeout: 50)

    assert System.monotonic_time(:millisecond) - started < 1_000
  end

  test "encodes nested node metadata and starts with an empty nonce" do
    metadata = %{"nested" => %{"list" => [nil, true, 3, "value"]}}

    request =
      GRPC.XDS.ADS.Request.discovery_request(:listener, ["service"], nil,
        node_id: "generic",
        node_metadata: metadata
      )

    decoded =
      request
      |> Envoy.Service.Discovery.V3.DiscoveryRequest.encode()
      |> Envoy.Service.Discovery.V3.DiscoveryRequest.decode()

    assert decoded == request
    assert decoded.version_info == ""
    assert decoded.response_nonce == ""
    {:struct_value, nested} = decoded.node.metadata.fields["nested"].kind
    {:list_value, list} = nested.fields["list"].kind

    assert Enum.map(list.values, & &1.kind) == [
             {:null_value, :NULL_VALUE},
             {:bool_value, true},
             {:number_value, 3.0},
             {:string_value, "value"}
           ]
  end

  test "handles interleaved resource types on one stream", %{url: url} do
    Application.put_env(:grpc_xds, :test_mode, :interleaved)

    assert [{"127.0.0.1", 8080}, {"127.0.0.2", 8081}] =
             GRPC.XDS.ADS.get_service_resource(url, "service")
  end

  test "accepts a complete xDS node", %{url: url} do
    node = %Envoy.Config.Core.V3.Node{
      id: "custom-node",
      locality: %Envoy.Config.Core.V3.Locality{zone: "zone-a"}
    }

    assert [_ | _] = GRPC.XDS.ADS.get_service_resource(url, "service", node: node)
    assert_receive {:request, _, :listener, %{node: ^node}}
  end

  test "rejects invalid URLs" do
    for url <- [
          "localhost",
          "ftp://localhost:123",
          "https://",
          "http://localhost/path",
          "http://user:pass@localhost",
          "http://localhost?token=secret",
          nil
        ] do
      assert {:error, :invalid_control_plane_url} =
               GRPC.XDS.ADS.get_service_resource(url, "service")
    end
  end

  test "reports a missing control plane address" do
    assert GRPC.XDS.ADS.lookup_service_addresses("service") ==
             {:error, :no_control_plane_address_set}
  end
end
