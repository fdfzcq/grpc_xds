defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig
  )
end

defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:host_rewrite_specifier, 0)
  field(:host_rewrite, 1, type: :string, oneof: 0)
  field(:auto_host_rewrite_header, 2, type: :string, oneof: 0)
end
