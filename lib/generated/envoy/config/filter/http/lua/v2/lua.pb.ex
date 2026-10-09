defmodule Envoy.Config.Filter.Http.Lua.V2.Lua do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:inline_code, 1, type: :string)
end
