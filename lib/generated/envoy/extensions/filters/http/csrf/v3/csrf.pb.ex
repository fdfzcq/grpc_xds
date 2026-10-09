defmodule Envoy.Extensions.Filters.Http.Csrf.V3.CsrfPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter_enabled, 1, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:shadow_enabled, 2, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:additional_origins, 3, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)
end
