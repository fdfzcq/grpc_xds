defmodule Envoy.Api.V2.Endpoint.UpstreamLocalityStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Api.V2.Core.Locality)
  field(:total_successful_requests, 2, type: :uint64)
  field(:total_requests_in_progress, 3, type: :uint64)
  field(:total_error_requests, 4, type: :uint64)
  field(:total_issued_requests, 8, type: :uint64)

  field(:load_metric_stats, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.EndpointLoadMetricStats
  )

  field(:upstream_endpoint_stats, 7,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.UpstreamEndpointStats
  )

  field(:priority, 6, type: :uint32)
end

defmodule Envoy.Api.V2.Endpoint.UpstreamEndpointStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Api.V2.Core.Address)
  field(:metadata, 6, type: Google.Protobuf.Struct)
  field(:total_successful_requests, 2, type: :uint64)
  field(:total_requests_in_progress, 3, type: :uint64)
  field(:total_error_requests, 4, type: :uint64)
  field(:total_issued_requests, 7, type: :uint64)

  field(:load_metric_stats, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.EndpointLoadMetricStats
  )
end

defmodule Envoy.Api.V2.Endpoint.EndpointLoadMetricStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:metric_name, 1, type: :string)
  field(:num_requests_finished_with_metric, 2, type: :uint64)
  field(:total_metric_value, 3, type: :double)
end

defmodule Envoy.Api.V2.Endpoint.ClusterStats.DroppedRequests do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:category, 1, type: :string)
  field(:dropped_count, 2, type: :uint64)
end

defmodule Envoy.Api.V2.Endpoint.ClusterStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:cluster_service_name, 6, type: :string)

  field(:upstream_locality_stats, 2,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.UpstreamLocalityStats
  )

  field(:total_dropped_requests, 3, type: :uint64)

  field(:dropped_requests, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.ClusterStats.DroppedRequests
  )

  field(:load_report_interval, 4, type: Google.Protobuf.Duration)
end
