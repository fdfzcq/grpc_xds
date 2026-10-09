defmodule Envoy.Extensions.TransportSockets.Tap.V3.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig)
  field(:transport_socket, 2, type: Envoy.Config.Core.V3.TransportSocket)
end
