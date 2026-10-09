defmodule Envoy.Extensions.Filters.Network.Wasm.V3.Wasm do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig)
end
