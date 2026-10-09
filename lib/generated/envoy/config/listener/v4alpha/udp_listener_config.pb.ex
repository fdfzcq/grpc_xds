defmodule Envoy.Config.Listener.V4alpha.UdpListenerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:udp_listener_name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Listener.V4alpha.ActiveRawUdpListenerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
