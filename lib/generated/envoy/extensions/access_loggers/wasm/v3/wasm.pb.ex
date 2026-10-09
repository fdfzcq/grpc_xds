defmodule Envoy.Extensions.AccessLoggers.Wasm.V3.WasmAccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig)
end
