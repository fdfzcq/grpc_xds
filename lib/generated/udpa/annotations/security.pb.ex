defmodule Udpa.Annotations.FieldSecurityAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:configure_for_untrusted_downstream, 1, type: :bool)
  field(:configure_for_untrusted_upstream, 2, type: :bool)
end
