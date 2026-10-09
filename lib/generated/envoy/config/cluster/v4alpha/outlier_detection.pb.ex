defmodule Envoy.Config.Cluster.V4alpha.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:consecutive_5xx, 1, type: Google.Protobuf.UInt32Value)
  field(:interval, 2, type: Google.Protobuf.Duration)
  field(:base_ejection_time, 3, type: Google.Protobuf.Duration)
  field(:max_ejection_percent, 4, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_5xx, 5, type: Google.Protobuf.UInt32Value)
  field(:enforcing_success_rate, 6, type: Google.Protobuf.UInt32Value)
  field(:success_rate_minimum_hosts, 7, type: Google.Protobuf.UInt32Value)
  field(:success_rate_request_volume, 8, type: Google.Protobuf.UInt32Value)
  field(:success_rate_stdev_factor, 9, type: Google.Protobuf.UInt32Value)
  field(:consecutive_gateway_failure, 10, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_gateway_failure, 11, type: Google.Protobuf.UInt32Value)
  field(:split_external_local_origin_errors, 12, type: :bool)
  field(:consecutive_local_origin_failure, 13, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_local_origin_failure, 14, type: Google.Protobuf.UInt32Value)
  field(:enforcing_local_origin_success_rate, 15, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_threshold, 16, type: Google.Protobuf.UInt32Value)
  field(:enforcing_failure_percentage, 17, type: Google.Protobuf.UInt32Value)
  field(:enforcing_failure_percentage_local_origin, 18, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_minimum_hosts, 19, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_request_volume, 20, type: Google.Protobuf.UInt32Value)
  field(:max_ejection_time, 21, type: Google.Protobuf.Duration)
end
