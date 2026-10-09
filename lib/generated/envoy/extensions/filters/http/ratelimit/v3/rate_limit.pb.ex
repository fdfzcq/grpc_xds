defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:OFF, 0)
  field(:DRAFT_VERSION_03, 1)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:OVERRIDE, 0)
  field(:INCLUDE, 1)
  field(:IGNORE, 2)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:domain, 1, type: :string)
  field(:stage, 2, type: :uint32)
  field(:request_type, 3, type: :string)
  field(:timeout, 4, type: Google.Protobuf.Duration)
  field(:failure_mode_deny, 5, type: :bool)
  field(:rate_limited_as_resource_exhausted, 6, type: :bool)
  field(:rate_limit_service, 7, type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig)

  field(:enable_x_ratelimit_headers, 8,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion,
    enum: true
  )

  field(:disable_x_envoy_ratelimited_header, 9, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:vh_rate_limits, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions,
    enum: true
  )
end
