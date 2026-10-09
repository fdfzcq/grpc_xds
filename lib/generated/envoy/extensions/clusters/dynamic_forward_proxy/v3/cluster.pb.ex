defmodule Envoy.Extensions.Clusters.DynamicForwardProxy.V3.ClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:dns_cache_config, 1, type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig)
  field(:allow_insecure_cluster_options, 2, type: :bool)
end
