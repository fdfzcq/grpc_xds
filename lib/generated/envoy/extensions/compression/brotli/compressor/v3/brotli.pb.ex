defmodule Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli.EncoderMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:GENERIC, 1)
  field(:TEXT, 2)
  field(:FONT, 3)
end

defmodule Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:quality, 1, type: Google.Protobuf.UInt32Value)

  field(:encoder_mode, 2,
    type: Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli.EncoderMode,
    enum: true
  )

  field(:window_bits, 3, type: Google.Protobuf.UInt32Value)
  field(:input_block_bits, 4, type: Google.Protobuf.UInt32Value)
  field(:chunk_size, 5, type: Google.Protobuf.UInt32Value)
  field(:disable_literal_context_modeling, 6, type: :bool)
end
