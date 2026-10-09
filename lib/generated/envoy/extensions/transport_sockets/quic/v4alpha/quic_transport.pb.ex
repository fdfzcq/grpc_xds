defmodule Envoy.Extensions.TransportSockets.Quic.V4alpha.QuicDownstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext
  )
end

defmodule Envoy.Extensions.TransportSockets.Quic.V4alpha.QuicUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.UpstreamTlsContext
  )
end
