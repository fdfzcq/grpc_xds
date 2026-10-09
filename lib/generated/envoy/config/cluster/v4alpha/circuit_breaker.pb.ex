defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.RetryBudget do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:budget_percent, 1, type: Envoy.Type.V3.Percent)
  field(:min_retry_concurrency, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:priority, 1, type: Envoy.Config.Core.V4alpha.RoutingPriority, enum: true)
  field(:max_connections, 2, type: Google.Protobuf.UInt32Value)
  field(:max_pending_requests, 3, type: Google.Protobuf.UInt32Value)
  field(:max_requests, 4, type: Google.Protobuf.UInt32Value)
  field(:max_retries, 5, type: Google.Protobuf.UInt32Value)

  field(:retry_budget, 8,
    type: Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.RetryBudget
  )

  field(:track_remaining, 6, type: :bool)
  field(:max_connection_pools, 7, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:thresholds, 1,
    repeated: true,
    type: Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds
  )
end
