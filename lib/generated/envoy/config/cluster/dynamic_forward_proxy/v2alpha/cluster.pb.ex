defmodule Envoy.Config.Cluster.DynamicForwardProxy.V2alpha.ClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig
  )
end
