defmodule Envoy.Extensions.Filters.Http.Tap.V4alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Extensions.Common.Tap.V4alpha.CommonExtensionConfig)
end
