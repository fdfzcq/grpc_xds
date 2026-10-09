defmodule Envoy.Admin.V2alpha.Clusters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_statuses, 1, repeated: true, type: Envoy.Admin.V2alpha.ClusterStatus)
end

defmodule Envoy.Admin.V2alpha.ClusterStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:added_via_api, 2, type: :bool)
  field(:success_rate_ejection_threshold, 3, type: Envoy.Type.Percent)
  field(:host_statuses, 4, repeated: true, type: Envoy.Admin.V2alpha.HostStatus)
  field(:local_origin_success_rate_ejection_threshold, 5, type: Envoy.Type.Percent)
end

defmodule Envoy.Admin.V2alpha.HostStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Api.V2.Core.Address)
  field(:stats, 2, repeated: true, type: Envoy.Admin.V2alpha.SimpleMetric)
  field(:health_status, 3, type: Envoy.Admin.V2alpha.HostHealthStatus)
  field(:success_rate, 4, type: Envoy.Type.Percent)
  field(:weight, 5, type: :uint32)
  field(:hostname, 6, type: :string)
  field(:priority, 7, type: :uint32)
  field(:local_origin_success_rate, 8, type: Envoy.Type.Percent)
  field(:locality, 9, type: Envoy.Api.V2.Core.Locality)
end

defmodule Envoy.Admin.V2alpha.HostHealthStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failed_active_health_check, 1, type: :bool)
  field(:failed_outlier_check, 2, type: :bool)
  field(:failed_active_degraded_check, 4, type: :bool)
  field(:pending_dynamic_removal, 5, type: :bool)
  field(:pending_active_hc, 6, type: :bool)
  field(:eds_health_status, 3, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
end
