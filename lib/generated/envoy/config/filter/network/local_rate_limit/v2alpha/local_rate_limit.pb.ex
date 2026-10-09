defmodule Envoy.Config.Filter.Network.LocalRateLimit.V2alpha.LocalRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:token_bucket, 2, type: Envoy.Type.TokenBucket)
  field(:runtime_enabled, 3, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
end
