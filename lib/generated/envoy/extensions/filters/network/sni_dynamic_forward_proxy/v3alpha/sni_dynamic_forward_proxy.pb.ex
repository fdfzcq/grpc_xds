defmodule Envoy.Extensions.Filters.Network.SniDynamicForwardProxy.V3alpha.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:port_specifier, 0)
  field(:dns_cache_config, 1, type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig)
  field(:port_value, 2, type: :uint32, oneof: 0)
end
