defmodule Envoy.Extensions.Filters.Http.HealthCheck.V4alpha.HealthCheck.ClusterMinHealthyPercentagesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Extensions.Filters.Http.HealthCheck.V4alpha.HealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:pass_through_mode, 1, type: Google.Protobuf.BoolValue)
  field(:cache_time, 3, type: Google.Protobuf.Duration)

  field(:cluster_min_healthy_percentages, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.HealthCheck.V4alpha.HealthCheck.ClusterMinHealthyPercentagesEntry,
    map: true
  )

  field(:headers, 5, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end
