defmodule Envoy.Extensions.TransportSockets.Starttls.V4alpha.StartTlsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer
  )

  field(:tls_socket_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext
  )
end
