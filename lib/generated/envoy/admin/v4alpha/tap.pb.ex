defmodule Envoy.Admin.V4alpha.TapRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_id, 1, type: :string)
  field(:tap_config, 2, type: Envoy.Config.Tap.V4alpha.TapConfig)
end
