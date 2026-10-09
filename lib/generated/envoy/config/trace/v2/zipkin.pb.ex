defmodule Envoy.Config.Trace.V2.ZipkinConfig.CollectorEndpointVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HTTP_JSON_V1, 0)
  field(:HTTP_JSON, 1)
  field(:HTTP_PROTO, 2)
  field(:GRPC, 3)
end

defmodule Envoy.Config.Trace.V2.ZipkinConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:collector_cluster, 1, type: :string)
  field(:collector_endpoint, 2, type: :string)
  field(:trace_id_128bit, 3, type: :bool)
  field(:shared_span_context, 4, type: Google.Protobuf.BoolValue)

  field(:collector_endpoint_version, 5,
    type: Envoy.Config.Trace.V2.ZipkinConfig.CollectorEndpointVersion,
    enum: true
  )
end
