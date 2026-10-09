defmodule Envoy.Extensions.TransportSockets.ProxyProtocol.V3.ProxyProtocolUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig)
  field(:transport_socket, 2, type: Envoy.Config.Core.V3.TransportSocket)
end
