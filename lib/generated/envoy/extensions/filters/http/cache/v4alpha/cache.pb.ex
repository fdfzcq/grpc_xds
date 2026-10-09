defmodule Envoy.Extensions.Filters.Http.Cache.V4alpha.CacheConfig.KeyCreatorParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:exclude_scheme, 1, type: :bool)
  field(:exclude_host, 2, type: :bool)

  field(:query_parameters_included, 3,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.QueryParameterMatcher
  )

  field(:query_parameters_excluded, 4,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.QueryParameterMatcher
  )
end

defmodule Envoy.Extensions.Filters.Http.Cache.V4alpha.CacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:typed_config, 1, type: Google.Protobuf.Any)
  field(:allowed_vary_headers, 2, repeated: true, type: Envoy.Type.Matcher.V4alpha.StringMatcher)

  field(:key_creator_params, 3,
    type: Envoy.Extensions.Filters.Http.Cache.V4alpha.CacheConfig.KeyCreatorParams
  )

  field(:max_body_bytes, 4, type: :uint32)
end
