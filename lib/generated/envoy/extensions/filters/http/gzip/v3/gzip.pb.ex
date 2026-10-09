defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:FILTERED, 1)
  field(:HUFFMAN, 2)
  field(:RLE, 3)
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel.Enum do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:BEST, 1)
  field(:SPEED, 2)
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.Gzip.V3.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:memory_level, 1, type: Google.Protobuf.UInt32Value)

  field(:compression_level, 3,
    type: Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionLevel.Enum,
    enum: true
  )

  field(:compression_strategy, 4,
    type: Envoy.Extensions.Filters.Http.Gzip.V3.Gzip.CompressionStrategy,
    enum: true
  )

  field(:window_bits, 9, type: Google.Protobuf.UInt32Value)
  field(:compressor, 10, type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor)
  field(:chunk_size, 11, type: Google.Protobuf.UInt32Value)
end
