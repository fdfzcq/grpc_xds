defmodule Envoy.Extensions.Clusters.Redis.V3.RedisClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_refresh_rate, 1, type: Google.Protobuf.Duration)
  field(:cluster_refresh_timeout, 2, type: Google.Protobuf.Duration)
  field(:redirect_refresh_interval, 3, type: Google.Protobuf.Duration)
  field(:redirect_refresh_threshold, 4, type: Google.Protobuf.UInt32Value)
  field(:failure_refresh_threshold, 5, type: :uint32)
  field(:host_degraded_refresh_threshold, 6, type: :uint32)
end
