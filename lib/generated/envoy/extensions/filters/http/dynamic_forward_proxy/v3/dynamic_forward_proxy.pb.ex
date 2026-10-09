defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:dns_cache_config, 1, type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig)
end

defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:host_rewrite_specifier, 0)
  field(:host_rewrite_literal, 1, type: :string, oneof: 0)
  field(:host_rewrite_header, 2, type: :string, oneof: 0)
end
