defmodule Envoy.Annotations.ResourceAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:type, 1, type: :string)
end
