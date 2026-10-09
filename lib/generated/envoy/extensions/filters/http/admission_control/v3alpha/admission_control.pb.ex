defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.HttpCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:http_success_status, 1, repeated: true, type: Envoy.Type.V3.Int32Range)
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.GrpcCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_success_status, 1, repeated: true, type: :uint32)
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:http_criteria, 1,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.HttpCriteria
  )

  field(:grpc_criteria, 2,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.GrpcCriteria
  )
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:evaluation_criteria, 0)
  field(:enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)

  field(:success_criteria, 2,
    type: Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria,
    oneof: 0
  )

  field(:sampling_window, 3, type: Google.Protobuf.Duration)
  field(:aggression, 4, type: Envoy.Config.Core.V3.RuntimeDouble)
  field(:sr_threshold, 5, type: Envoy.Config.Core.V3.RuntimePercent)
end
