defmodule Envoy.Config.ResourceMonitor.FixedHeap.V2alpha.FixedHeapConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_heap_size_bytes, 1, type: :uint64)
end
