defmodule Envoy.Watchdog.V3alpha.AbortActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:wait_duration, 1, type: Google.Protobuf.Duration)
end
