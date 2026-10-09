defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:OK, 1)
  field(:OVER_LIMIT, 2)
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:SECOND, 1)
  field(:MINUTE, 2)
  field(:HOUR, 3)
  field(:DAY, 4)
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:domain, 1, type: :string)

  field(:descriptors, 2,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor
  )

  field(:hits_addend, 3, type: :uint32)
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 3, type: :string)
  field(:requests_per_unit, 1, type: :uint32)
  field(:unit, 2, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit, enum: true)
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:code, 1, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code, enum: true)
  field(:current_limit, 2, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit)
  field(:limit_remaining, 3, type: :uint32)
  field(:duration_until_reset, 4, type: Google.Protobuf.Duration)
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:overall_code, 1, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code, enum: true)

  field(:statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus
  )

  field(:response_headers_to_add, 3, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
  field(:request_headers_to_add, 4, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
  field(:raw_body, 5, type: :bytes)
  field(:dynamic_metadata, 6, type: Google.Protobuf.Struct)
end
