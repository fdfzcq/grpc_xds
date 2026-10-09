defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExternalProcessor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
  field(:failure_mode_allow, 2, type: :bool)
  field(:processing_mode, 3, type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode)
  field(:async_mode, 4, type: :bool)
  field(:request_attributes, 5, repeated: true, type: :string)
  field(:response_attributes, 6, repeated: true, type: :string)
  field(:message_timeout, 7, type: Google.Protobuf.Duration)
  field(:stat_prefix, 8, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)

  field(:overrides, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcOverrides,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcOverrides do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:processing_mode, 1, type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode)
  field(:async_mode, 2, type: :bool)
  field(:request_properties, 3, repeated: true, type: :string)
  field(:response_properties, 4, repeated: true, type: :string)
end
