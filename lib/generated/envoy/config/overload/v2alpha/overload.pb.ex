defmodule Envoy.Config.Overload.V2alpha.ResourceMonitor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Overload.V2alpha.ThresholdTrigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:value, 1, type: :double)
end

defmodule Envoy.Config.Overload.V2alpha.Trigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:trigger_oneof, 0)
  field(:name, 1, type: :string)
  field(:threshold, 2, type: Envoy.Config.Overload.V2alpha.ThresholdTrigger, oneof: 0)
end

defmodule Envoy.Config.Overload.V2alpha.OverloadAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:triggers, 2, repeated: true, type: Envoy.Config.Overload.V2alpha.Trigger)
end

defmodule Envoy.Config.Overload.V2alpha.OverloadManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:refresh_interval, 1, type: Google.Protobuf.Duration)

  field(:resource_monitors, 2,
    repeated: true,
    type: Envoy.Config.Overload.V2alpha.ResourceMonitor
  )

  field(:actions, 3, repeated: true, type: Envoy.Config.Overload.V2alpha.OverloadAction)
end
