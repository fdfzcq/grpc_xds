defmodule Envoy.Config.Core.V3.SocketOption.SocketState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:STATE_PREBIND, 0)
  field(:STATE_BOUND, 1)
  field(:STATE_LISTENING, 2)
end

defmodule Envoy.Config.Core.V3.SocketOption do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:value, 0)
  field(:description, 1, type: :string)
  field(:level, 2, type: :int64)
  field(:name, 3, type: :int64)
  field(:int_value, 4, type: :int64, oneof: 0)
  field(:buf_value, 5, type: :bytes, oneof: 0)
  field(:state, 6, type: Envoy.Config.Core.V3.SocketOption.SocketState, enum: true)
end
