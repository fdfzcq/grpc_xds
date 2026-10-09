defmodule Envoy.Extensions.RateLimitDescriptors.Expr.V3.Descriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:expr_specifier, 0)
  field(:descriptor_key, 1, type: :string)
  field(:skip_if_error, 2, type: :bool)
  field(:text, 3, type: :string, oneof: 0)
  field(:parsed, 4, type: Google.Api.Expr.V1alpha1.Expr, oneof: 0)
end
