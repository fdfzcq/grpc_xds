defmodule Envoy.Config.Ratelimit.V2.RateLimitServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
end
