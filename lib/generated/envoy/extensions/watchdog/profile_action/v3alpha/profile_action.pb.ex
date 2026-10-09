defmodule Envoy.Extensions.Watchdog.ProfileAction.V3alpha.ProfileActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:profile_duration, 1, type: Google.Protobuf.Duration)
  field(:profile_path, 2, type: :string)
  field(:max_profiles, 3, type: :uint64)
end
