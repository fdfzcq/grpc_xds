defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:FILTERED, 1)
  field(:HUFFMAN, 2)
  field(:RLE, 3)
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:BEST, 1)
  field(:SPEED, 2)
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:memory_level, 1, type: Google.Protobuf.UInt32Value)
  field(:content_length, 2, type: Google.Protobuf.UInt32Value, deprecated: true)

  field(:compression_level, 3,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum,
    enum: true
  )

  field(:compression_strategy, 4,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy,
    enum: true
  )

  field(:content_type, 6, repeated: true, type: :string, deprecated: true)
  field(:disable_on_etag_header, 7, type: :bool, deprecated: true)
  field(:remove_accept_encoding_header, 8, type: :bool, deprecated: true)
  field(:window_bits, 9, type: Google.Protobuf.UInt32Value)
  field(:compressor, 10, type: Envoy.Config.Filter.Http.Compressor.V2.Compressor)
end
