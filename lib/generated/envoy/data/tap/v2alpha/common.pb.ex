defmodule Envoy.Data.Tap.V2alpha.Body do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:body_type, 0)
  field(:as_bytes, 1, type: :bytes, oneof: 0)
  field(:as_string, 2, type: :string, oneof: 0)
  field(:truncated, 3, type: :bool)
end
