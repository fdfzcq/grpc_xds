defmodule Envoy.Config.Ratelimit.V4alpha.RateLimitServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 2, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:transport_api_version, 4, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
end
