defmodule GrpcXdsTest.ControlPlane do
  use GRPC.Server, service: GRPC.XDS.ADS.Service
  alias GRPC.XDS.ADS.TypeMap

  def stream_aggregated_resources(requests, materializer) do
    requests
    |> GRPC.Stream.from(max_demand: 1)
    |> GRPC.Stream.map(fn request ->
      type = TypeMap.type_url_to_type_atom(request.type_url)

      %Envoy.Service.Discovery.V3.DiscoveryResponse{
        type_url: request.type_url,
        version_info: "1",
        nonce: "1",
        resources: [pack(resource(type, request.resource_names))]
      }
    end)
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

  defp resource(:cluster_load_assignment, ["cluster"]) do
    %Envoy.Config.Endpoint.V3.ClusterLoadAssignment{
      cluster_name: "cluster",
      endpoints: [
        locality(1, [{"127.0.0.3", 9000}]),
        locality(10, [{"127.0.0.1", 8080}, {"127.0.0.2", 8081}])
      ]
    }
  end

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

    for {key, value} <- [
          project_id: "test-node",
          node_cluster: "test",
          node_metadata: %{},
          user_agent_name: "test"
        ] do
      Application.put_env(:grpc_xds, key, value)
    end

    on_exit(fn ->
      for {key, _} <- Application.get_all_env(:grpc_xds),
          do: Application.delete_env(:grpc_xds, key)

      for {key, value} <- previous, do: Application.put_env(:grpc_xds, key, value)
    end)

    :ok
  end

  test "discovers addresses from the highest-weight locality over gRPC" do
    server = GrpcXdsTest.ControlPlane
    {:ok, _, port} = GRPC.Server.start(server, 0)
    on_exit(fn -> GRPC.Server.stop(server) end)
    {:ok, channel} = GRPC.Stub.connect("localhost:#{port}")
    on_exit(fn -> GRPC.Stub.disconnect(channel) end)

    pid =
      start_supervised!(%{
        id: GRPC.XDS.ADS.Stream,
        start: {GenServer, :start_link, [GRPC.XDS.ADS.Stream, channel]}
      })

    assert {:ok, [{"127.0.0.1", 8080}, {"127.0.0.2", 8081}]} =
             GenServer.call(pid, {:send_discovery_request, ["service"]})
  end

  test "reports a missing control plane address" do
    Application.delete_env(:grpc_xds, :control_plane_address)

    assert GRPC.XDS.ADS.lookup_service_addresses("service") ==
             {:error, :no_control_plane_address_set}
  end
end
