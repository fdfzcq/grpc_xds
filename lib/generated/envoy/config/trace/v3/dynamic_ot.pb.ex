defmodule Envoy.Config.Trace.V3.DynamicOtConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:library, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct)
end
