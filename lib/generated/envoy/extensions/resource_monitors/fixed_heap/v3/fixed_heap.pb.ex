defmodule Envoy.Extensions.ResourceMonitors.FixedHeap.V3.FixedHeapConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_heap_size_bytes, 1, type: :uint64)
end
