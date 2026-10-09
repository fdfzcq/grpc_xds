defmodule Envoy.Config.Ratelimit.V3.RateLimitServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 2, type: Envoy.Config.Core.V3.GrpcService)
  field(:transport_api_version, 4, type: Envoy.Config.Core.V3.ApiVersion, enum: true)
end
