defmodule Envoy.Extensions.Filters.Http.Csrf.V4alpha.CsrfPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter_enabled, 1, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent)
  field(:shadow_enabled, 2, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent)
  field(:additional_origins, 3, repeated: true, type: Envoy.Type.Matcher.V4alpha.StringMatcher)
end
