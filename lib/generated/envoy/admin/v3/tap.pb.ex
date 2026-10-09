defmodule Envoy.Admin.V3.TapRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_id, 1, type: :string)
  field(:tap_config, 2, type: Envoy.Config.Tap.V3.TapConfig)
end
