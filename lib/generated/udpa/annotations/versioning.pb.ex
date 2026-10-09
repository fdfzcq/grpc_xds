defmodule Udpa.Annotations.VersioningAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:previous_message_type, 1, type: :string)
end
