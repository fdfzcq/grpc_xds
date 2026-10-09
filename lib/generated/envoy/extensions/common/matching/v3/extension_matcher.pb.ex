defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:matcher, 1, type: Envoy.Config.Common.Matcher.V3.Matcher)
  field(:extension_config, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end
