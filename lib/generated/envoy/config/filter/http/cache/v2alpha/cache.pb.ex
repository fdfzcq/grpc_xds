defmodule Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig.KeyCreatorParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:exclude_scheme, 1, type: :bool)
  field(:exclude_host, 2, type: :bool)

  field(:query_parameters_included, 3,
    repeated: true,
    type: Envoy.Api.V2.Route.QueryParameterMatcher
  )

  field(:query_parameters_excluded, 4,
    repeated: true,
    type: Envoy.Api.V2.Route.QueryParameterMatcher
  )
end

defmodule Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:typed_config, 1, type: Google.Protobuf.Any)
  field(:allowed_vary_headers, 2, repeated: true, type: Envoy.Type.Matcher.StringMatcher)

  field(:key_creator_params, 3,
    type: Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig.KeyCreatorParams
  )

  field(:max_body_bytes, 4, type: :uint32)
end
