defmodule Envoy.Extensions.Filters.Http.Fault.V4alpha.FaultAbort.HeaderAbort do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.Fault.V4alpha.FaultAbort do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:error_type, 0)
  field(:http_status, 2, type: :uint32, oneof: 0)
  field(:grpc_status, 5, type: :uint32, oneof: 0)

  field(:header_abort, 4,
    type: Envoy.Extensions.Filters.Http.Fault.V4alpha.FaultAbort.HeaderAbort,
    oneof: 0
  )

  field(:percentage, 3, type: Envoy.Type.V3.FractionalPercent)
end

defmodule Envoy.Extensions.Filters.Http.Fault.V4alpha.HTTPFault do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:delay, 1, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay)
  field(:abort, 2, type: Envoy.Extensions.Filters.Http.Fault.V4alpha.FaultAbort)
  field(:upstream_cluster, 3, type: :string)
  field(:headers, 4, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
  field(:downstream_nodes, 5, repeated: true, type: :string)
  field(:max_active_faults, 6, type: Google.Protobuf.UInt32Value)
  field(:response_rate_limit, 7, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit)
  field(:delay_percent_runtime, 8, type: :string)
  field(:abort_percent_runtime, 9, type: :string)
  field(:delay_duration_runtime, 10, type: :string)
  field(:abort_http_status_runtime, 11, type: :string)
  field(:max_active_faults_runtime, 12, type: :string)
  field(:response_rate_limit_percent_runtime, 13, type: :string)
  field(:abort_grpc_status_runtime, 14, type: :string)
end
