defmodule Envoy.Type.V3.TokenBucket do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_tokens, 1, type: :uint32)
  field(:tokens_per_fill, 2, type: Google.Protobuf.UInt32Value)
  field(:fill_interval, 3, type: Google.Protobuf.Duration)
end
