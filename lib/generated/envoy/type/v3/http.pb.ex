defmodule Envoy.Type.V3.CodecClientType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HTTP1, 0)
  field(:HTTP2, 1)
  field(:HTTP3, 2)
end
