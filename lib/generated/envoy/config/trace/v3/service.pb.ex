defmodule Envoy.Config.Trace.V3.TraceServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
end
