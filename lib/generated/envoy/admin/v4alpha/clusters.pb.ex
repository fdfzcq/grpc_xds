defmodule Envoy.Admin.V4alpha.Clusters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_statuses, 1, repeated: true, type: Envoy.Admin.V4alpha.ClusterStatus)
end

defmodule Envoy.Admin.V4alpha.ClusterStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:added_via_api, 2, type: :bool)
  field(:success_rate_ejection_threshold, 3, type: Envoy.Type.V3.Percent)
  field(:host_statuses, 4, repeated: true, type: Envoy.Admin.V4alpha.HostStatus)
  field(:local_origin_success_rate_ejection_threshold, 5, type: Envoy.Type.V3.Percent)
  field(:circuit_breakers, 6, type: Envoy.Config.Cluster.V4alpha.CircuitBreakers)
  field(:observability_name, 7, type: :string)
end

defmodule Envoy.Admin.V4alpha.HostStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Config.Core.V4alpha.Address)
  field(:stats, 2, repeated: true, type: Envoy.Admin.V4alpha.SimpleMetric)
  field(:health_status, 3, type: Envoy.Admin.V4alpha.HostHealthStatus)
  field(:success_rate, 4, type: Envoy.Type.V3.Percent)
  field(:weight, 5, type: :uint32)
  field(:hostname, 6, type: :string)
  field(:priority, 7, type: :uint32)
  field(:local_origin_success_rate, 8, type: Envoy.Type.V3.Percent)
  field(:locality, 9, type: Envoy.Config.Core.V4alpha.Locality)
end

defmodule Envoy.Admin.V4alpha.HostHealthStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failed_active_health_check, 1, type: :bool)
  field(:failed_outlier_check, 2, type: :bool)
  field(:failed_active_degraded_check, 4, type: :bool)
  field(:pending_dynamic_removal, 5, type: :bool)
  field(:pending_active_hc, 6, type: :bool)
  field(:excluded_via_immediate_hc_fail, 7, type: :bool)
  field(:active_hc_timeout, 8, type: :bool)
  field(:eds_health_status, 3, type: Envoy.Config.Core.V4alpha.HealthStatus, enum: true)
end
