defmodule Envoy.Config.Endpoint.V3.UpstreamLocalityStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:total_successful_requests, 2, type: :uint64)
  field(:total_requests_in_progress, 3, type: :uint64)
  field(:total_error_requests, 4, type: :uint64)
  field(:total_issued_requests, 8, type: :uint64)

  field(:load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats
  )

  field(:upstream_endpoint_stats, 7,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamEndpointStats
  )

  field(:priority, 6, type: :uint32)
end

defmodule Envoy.Config.Endpoint.V3.UpstreamEndpointStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Config.Core.V3.Address)
  field(:metadata, 6, type: Google.Protobuf.Struct)
  field(:total_successful_requests, 2, type: :uint64)
  field(:total_requests_in_progress, 3, type: :uint64)
  field(:total_error_requests, 4, type: :uint64)
  field(:total_issued_requests, 7, type: :uint64)

  field(:load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats
  )
end

defmodule Envoy.Config.Endpoint.V3.EndpointLoadMetricStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:metric_name, 1, type: :string)
  field(:num_requests_finished_with_metric, 2, type: :uint64)
  field(:total_metric_value, 3, type: :double)
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:category, 1, type: :string)
  field(:dropped_count, 2, type: :uint64)
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:cluster_service_name, 6, type: :string)

  field(:upstream_locality_stats, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamLocalityStats
  )

  field(:total_dropped_requests, 3, type: :uint64)

  field(:dropped_requests, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests
  )

  field(:load_report_interval, 4, type: Google.Protobuf.Duration)
end
