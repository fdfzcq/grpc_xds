defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:OK, 1)
  field(:OVER_LIMIT, 2)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:SECOND, 1)
  field(:MINUTE, 2)
  field(:HOUR, 3)
  field(:DAY, 4)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:domain, 1, type: :string)
  field(:descriptors, 2, repeated: true, type: Envoy.Api.V2.Ratelimit.RateLimitDescriptor)
  field(:hits_addend, 3, type: :uint32)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 3, type: :string)
  field(:requests_per_unit, 1, type: :uint32)
  field(:unit, 2, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit, enum: true)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:code, 1, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code, enum: true)
  field(:current_limit, 2, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit)
  field(:limit_remaining, 3, type: :uint32)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:overall_code, 1, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code, enum: true)

  field(:statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus
  )

  field(:headers, 3, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
  field(:request_headers_to_add, 4, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end
