defmodule Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:NONE, 0)
  field(:TRACE_CONTEXT, 1)
  field(:GRPC_TRACE_BIN, 2)
  field(:CLOUD_TRACE_CONTEXT, 3)
  field(:B3, 4)
end

defmodule Envoy.Config.Trace.V2.OpenCensusConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trace_config, 1, type: Opencensus.Proto.Trace.V1.TraceConfig)
  field(:stdout_exporter_enabled, 2, type: :bool)
  field(:stackdriver_exporter_enabled, 3, type: :bool)
  field(:stackdriver_project_id, 4, type: :string)
  field(:stackdriver_address, 10, type: :string)
  field(:stackdriver_grpc_service, 13, type: Envoy.Api.V2.Core.GrpcService)
  field(:zipkin_exporter_enabled, 5, type: :bool)
  field(:zipkin_url, 6, type: :string)
  field(:ocagent_exporter_enabled, 11, type: :bool)
  field(:ocagent_address, 12, type: :string)
  field(:ocagent_grpc_service, 14, type: Envoy.Api.V2.Core.GrpcService)

  field(:incoming_trace_context, 8,
    repeated: true,
    type: Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext,
    enum: true
  )

  field(:outgoing_trace_context, 9,
    repeated: true,
    type: Envoy.Config.Trace.V2.OpenCensusConfig.TraceContext,
    enum: true
  )
end
