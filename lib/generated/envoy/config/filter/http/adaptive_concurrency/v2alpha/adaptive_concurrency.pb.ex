defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.ConcurrencyLimitCalculationParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_concurrency_limit, 2, type: Google.Protobuf.UInt32Value)
  field(:concurrency_update_interval, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.MinimumRTTCalculationParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:interval, 1, type: Google.Protobuf.Duration)
  field(:request_count, 2, type: Google.Protobuf.UInt32Value)
  field(:jitter, 3, type: Envoy.Type.Percent)
  field(:min_concurrency, 4, type: Google.Protobuf.UInt32Value)
  field(:buffer, 5, type: Envoy.Type.Percent)
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:sample_aggregate_percentile, 1, type: Envoy.Type.Percent)

  field(:concurrency_limit_params, 2,
    type:
      Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.ConcurrencyLimitCalculationParams
  )

  field(:min_rtt_calc_params, 3,
    type:
      Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig.MinimumRTTCalculationParams
  )
end

defmodule Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.AdaptiveConcurrency do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:concurrency_controller_config, 0)

  field(:gradient_controller_config, 1,
    type: Envoy.Config.Filter.Http.AdaptiveConcurrency.V2alpha.GradientControllerConfig,
    oneof: 0
  )

  field(:enabled, 2, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
end
