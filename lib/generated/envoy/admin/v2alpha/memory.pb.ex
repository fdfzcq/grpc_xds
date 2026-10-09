defmodule Envoy.Admin.V2alpha.Memory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allocated, 1, type: :uint64)
  field(:heap_size, 2, type: :uint64)
  field(:pageheap_unmapped, 3, type: :uint64)
  field(:pageheap_free, 4, type: :uint64)
  field(:total_thread_cache, 5, type: :uint64)
  field(:total_physical_bytes, 6, type: :uint64)
end
