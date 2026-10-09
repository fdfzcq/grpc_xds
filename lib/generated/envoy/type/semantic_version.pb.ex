defmodule Envoy.Type.SemanticVersion do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:major_number, 1, type: :uint32)
  field(:minor_number, 2, type: :uint32)
  field(:patch, 3, type: :uint32)
end
