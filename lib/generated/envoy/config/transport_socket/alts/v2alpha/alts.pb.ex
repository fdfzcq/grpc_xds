defmodule Envoy.Config.TransportSocket.Alts.V2alpha.Alts do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:handshaker_service, 1, type: :string)
  field(:peer_service_accounts, 2, repeated: true, type: :string)
end
