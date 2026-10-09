defmodule Envoy.Config.Listener.V4alpha.QuicProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_concurrent_streams, 1, type: Google.Protobuf.UInt32Value)
  field(:idle_timeout, 2, type: Google.Protobuf.Duration)
  field(:crypto_handshake_timeout, 3, type: Google.Protobuf.Duration)
  field(:enabled, 4, type: Envoy.Config.Core.V4alpha.RuntimeFeatureFlag)
end
