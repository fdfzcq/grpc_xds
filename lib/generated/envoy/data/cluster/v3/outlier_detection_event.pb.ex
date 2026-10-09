defmodule Envoy.Data.Cluster.V3.OutlierEjectionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:CONSECUTIVE_5XX, 0)
  field(:CONSECUTIVE_GATEWAY_FAILURE, 1)
  field(:SUCCESS_RATE, 2)
  field(:CONSECUTIVE_LOCAL_ORIGIN_FAILURE, 3)
  field(:SUCCESS_RATE_LOCAL_ORIGIN, 4)
  field(:FAILURE_PERCENTAGE, 5)
  field(:FAILURE_PERCENTAGE_LOCAL_ORIGIN, 6)
end

defmodule Envoy.Data.Cluster.V3.Action do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:EJECT, 0)
  field(:UNEJECT, 1)
end

defmodule Envoy.Data.Cluster.V3.OutlierDetectionEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:event, 0)
  field(:type, 1, type: Envoy.Data.Cluster.V3.OutlierEjectionType, enum: true)
  field(:timestamp, 2, type: Google.Protobuf.Timestamp)
  field(:secs_since_last_action, 3, type: Google.Protobuf.UInt64Value)
  field(:cluster_name, 4, type: :string)
  field(:upstream_url, 5, type: :string)
  field(:action, 6, type: Envoy.Data.Cluster.V3.Action, enum: true)
  field(:num_ejections, 7, type: :uint32)
  field(:enforced, 8, type: :bool)

  field(:eject_success_rate_event, 9,
    type: Envoy.Data.Cluster.V3.OutlierEjectSuccessRate,
    oneof: 0
  )

  field(:eject_consecutive_event, 10,
    type: Envoy.Data.Cluster.V3.OutlierEjectConsecutive,
    oneof: 0
  )

  field(:eject_failure_percentage_event, 11,
    type: Envoy.Data.Cluster.V3.OutlierEjectFailurePercentage,
    oneof: 0
  )
end

defmodule Envoy.Data.Cluster.V3.OutlierEjectSuccessRate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:host_success_rate, 1, type: :uint32)
  field(:cluster_average_success_rate, 2, type: :uint32)
  field(:cluster_success_rate_ejection_threshold, 3, type: :uint32)
end

defmodule Envoy.Data.Cluster.V3.OutlierEjectConsecutive do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Data.Cluster.V3.OutlierEjectFailurePercentage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:host_success_rate, 1, type: :uint32)
end
