defmodule Envoy.Config.Filter.Http.Csrf.V2.CsrfPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter_enabled, 1, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:shadow_enabled, 2, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:additional_origins, 3, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
end
