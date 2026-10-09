defmodule Envoy.Extensions.Filters.Listener.OriginalSrc.V3.OriginalSrc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:bind_port, 1, type: :bool)
  field(:mark, 2, type: :uint32)
end
