defmodule Envoy.Config.Filter.Thrift.RateLimit.V2alpha1.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:domain, 1, type: :string)
  field(:stage, 2, type: :uint32)
  field(:timeout, 3, type: Google.Protobuf.Duration)
  field(:failure_mode_deny, 4, type: :bool)
  field(:rate_limit_service, 5, type: Envoy.Config.Ratelimit.V2.RateLimitServiceConfig)
end
