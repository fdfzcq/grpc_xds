defmodule Envoy.Config.Metrics.V2.MetricsServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService)
end
