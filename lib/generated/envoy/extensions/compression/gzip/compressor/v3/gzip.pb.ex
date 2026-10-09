defmodule Envoy.Extensions.Compression.Gzip.Compressor.V3.Gzip.CompressionStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT_STRATEGY, 0)
  field(:FILTERED, 1)
  field(:HUFFMAN_ONLY, 2)
  field(:RLE, 3)
  field(:FIXED, 4)
end

defmodule Envoy.Extensions.Compression.Gzip.Compressor.V3.Gzip.CompressionLevel do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT_COMPRESSION, 0)
  field(:BEST_SPEED, 1)
  field(:COMPRESSION_LEVEL_1, 1)
  field(:COMPRESSION_LEVEL_2, 2)
  field(:COMPRESSION_LEVEL_3, 3)
  field(:COMPRESSION_LEVEL_4, 4)
  field(:COMPRESSION_LEVEL_5, 5)
  field(:COMPRESSION_LEVEL_6, 6)
  field(:COMPRESSION_LEVEL_7, 7)
  field(:COMPRESSION_LEVEL_8, 8)
  field(:COMPRESSION_LEVEL_9, 9)
  field(:BEST_COMPRESSION, 9)
end

defmodule Envoy.Extensions.Compression.Gzip.Compressor.V3.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:memory_level, 1, type: Google.Protobuf.UInt32Value)

  field(:compression_level, 2,
    type: Envoy.Extensions.Compression.Gzip.Compressor.V3.Gzip.CompressionLevel,
    enum: true
  )

  field(:compression_strategy, 3,
    type: Envoy.Extensions.Compression.Gzip.Compressor.V3.Gzip.CompressionStrategy,
    enum: true
  )

  field(:window_bits, 4, type: Google.Protobuf.UInt32Value)
  field(:chunk_size, 5, type: Google.Protobuf.UInt32Value)
end
