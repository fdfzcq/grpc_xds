defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicDownstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext
  )
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext
  )
end
