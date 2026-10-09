defmodule Envoy.Admin.V2alpha.TapRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_id, 1, type: :string)
  field(:tap_config, 2, type: Envoy.Service.Tap.V2alpha.TapConfig)
end
