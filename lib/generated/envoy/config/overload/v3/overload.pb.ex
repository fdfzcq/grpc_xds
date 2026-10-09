defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNSPECIFIED, 0)
  field(:HTTP_DOWNSTREAM_CONNECTION_IDLE, 1)
  field(:HTTP_DOWNSTREAM_STREAM_IDLE, 2)
  field(:TRANSPORT_SOCKET_CONNECT, 3)
end

defmodule Envoy.Config.Overload.V3.ResourceMonitor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Overload.V3.ThresholdTrigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:value, 1, type: :double)
end

defmodule Envoy.Config.Overload.V3.ScaledTrigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:scaling_threshold, 1, type: :double)
  field(:saturation_threshold, 2, type: :double)
end

defmodule Envoy.Config.Overload.V3.Trigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:trigger_oneof, 0)
  field(:name, 1, type: :string)
  field(:threshold, 2, type: Envoy.Config.Overload.V3.ThresholdTrigger, oneof: 0)
  field(:scaled, 3, type: Envoy.Config.Overload.V3.ScaledTrigger, oneof: 0)
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:overload_adjust, 0)

  field(:timer, 1,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType,
    enum: true
  )

  field(:min_timeout, 2, type: Google.Protobuf.Duration, oneof: 0)
  field(:min_scale, 3, type: Envoy.Type.V3.Percent, oneof: 0)
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:timer_scale_factors, 1,
    repeated: true,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer
  )
end

defmodule Envoy.Config.Overload.V3.OverloadAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger)
  field(:typed_config, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Overload.V3.OverloadManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:refresh_interval, 1, type: Google.Protobuf.Duration)
  field(:resource_monitors, 2, repeated: true, type: Envoy.Config.Overload.V3.ResourceMonitor)
  field(:actions, 3, repeated: true, type: Envoy.Config.Overload.V3.OverloadAction)
end
