defmodule Envoy.Config.TransportSocket.Tap.V2alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig)
  field(:transport_socket, 2, type: Envoy.Api.V2.Core.TransportSocket)
end
