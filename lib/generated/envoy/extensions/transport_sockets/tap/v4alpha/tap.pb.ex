defmodule Envoy.Extensions.TransportSockets.Tap.V4alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Extensions.Common.Tap.V4alpha.CommonExtensionConfig)
  field(:transport_socket, 2, type: Envoy.Config.Core.V4alpha.TransportSocket)
end
