defmodule Envoy.Extensions.TransportSockets.Alts.V3.Alts do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:handshaker_service, 1, type: :string)
  field(:peer_service_accounts, 2, repeated: true, type: :string)
end
