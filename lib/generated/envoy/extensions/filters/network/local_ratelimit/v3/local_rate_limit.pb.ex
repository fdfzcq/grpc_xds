defmodule Envoy.Extensions.Filters.Network.LocalRatelimit.V3.LocalRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:token_bucket, 2, type: Envoy.Type.V3.TokenBucket)
  field(:runtime_enabled, 3, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
end
