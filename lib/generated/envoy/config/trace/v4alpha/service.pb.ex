defmodule Envoy.Config.Trace.V4alpha.TraceServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 1, type: Envoy.Config.Core.V4alpha.GrpcService)
end
