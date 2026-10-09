defmodule Envoy.Extensions.Compression.Gzip.Decompressor.V3.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:window_bits, 1, type: Google.Protobuf.UInt32Value)
  field(:chunk_size, 2, type: Google.Protobuf.UInt32Value)
end
