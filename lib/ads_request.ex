defmodule GRPC.XDS.ADS.Request do
  alias Envoy.Config.Core.V3.Node

  def discovery_request(type, resources, version, opts \\ []) do
    %Envoy.Service.Discovery.V3.DiscoveryRequest{
      type_url: GRPC.XDS.ADS.TypeMap.type_atom_to_type_url(type),
      response_nonce: Keyword.get(opts, :nonce, ""),
      resource_names: resources,
      node: Keyword.get_lazy(opts, :node, fn -> xds_node(opts) end),
      version_info: version || ""
    }
  end

  def xds_node(opts \\ []) do
    case Keyword.get(opts, :node) do
      %Node{} = node ->
        node

      nil ->
        %Node{
          id: option(opts, :node_id, "grpc-xds"),
          cluster: option(opts, :node_cluster, ""),
          metadata: protobuf_struct(option(opts, :node_metadata, %{})),
          user_agent_name: "grpc_xds",
          client_features: ["envoy.lb.does_not_support_overprovisioning"]
        }
    end
  end

  defp option(opts, key, default),
    do: Keyword.get(opts, key, Application.get_env(:grpc_xds, key, default))

  defp protobuf_struct(map) when is_map(map) do
    %Google.Protobuf.Struct{
      fields: Map.new(map, fn {key, value} -> {to_string(key), protobuf_value(value)} end)
    }
  end

  defp protobuf_value(value) do
    kind =
      cond do
        is_nil(value) ->
          {:null_value, :NULL_VALUE}

        is_boolean(value) ->
          {:bool_value, value}

        is_number(value) ->
          {:number_value, value}

        is_binary(value) ->
          {:string_value, value}

        is_map(value) ->
          {:struct_value, protobuf_struct(value)}

        is_list(value) ->
          {:list_value, %Google.Protobuf.ListValue{values: Enum.map(value, &protobuf_value/1)}}

        true ->
          raise ArgumentError, "node metadata must contain JSON-compatible values"
      end

    %Google.Protobuf.Value{kind: kind}
  end
end
