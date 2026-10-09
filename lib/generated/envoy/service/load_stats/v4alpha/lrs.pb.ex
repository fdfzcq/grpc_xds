defmodule Envoy.Service.LoadStats.V4alpha.LoadStatsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
  field(:cluster_stats, 2, repeated: true, type: Envoy.Config.Endpoint.V3.ClusterStats)
end

defmodule Envoy.Service.LoadStats.V4alpha.LoadStatsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1, repeated: true, type: :string)
  field(:send_all_clusters, 4, type: :bool)
  field(:load_reporting_interval, 2, type: Google.Protobuf.Duration)
  field(:report_endpoint_granularity, 3, type: :bool)
end
