defmodule Envoy.Extensions.Compression.Brotli.Decompressor.V3.Brotli do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:disable_ring_buffer_reallocation, 1, type: :bool)
  field(:chunk_size, 2, type: Google.Protobuf.UInt32Value)
end
