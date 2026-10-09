defmodule Envoy.Extensions.Filters.Http.OriginalSrc.V3.OriginalSrc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:mark, 1, type: :uint32)
end
