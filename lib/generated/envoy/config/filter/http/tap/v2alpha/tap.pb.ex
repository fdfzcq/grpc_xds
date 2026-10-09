defmodule Envoy.Config.Filter.Http.Tap.V2alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig)
end
