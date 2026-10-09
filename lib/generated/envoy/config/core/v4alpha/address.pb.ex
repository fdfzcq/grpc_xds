defmodule Envoy.Config.Core.V4alpha.SocketAddress.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:TCP, 0)
  field(:UDP, 1)
end

defmodule Envoy.Config.Core.V4alpha.Pipe do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:path, 1, type: :string)
  field(:mode, 2, type: :uint32)
end

defmodule Envoy.Config.Core.V4alpha.EnvoyInternalAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:address_name_specifier, 0)
  field(:server_listener_name, 1, type: :string, oneof: 0)
end

defmodule Envoy.Config.Core.V4alpha.SocketAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:port_specifier, 0)
  field(:protocol, 1, type: Envoy.Config.Core.V4alpha.SocketAddress.Protocol, enum: true)
  field(:address, 2, type: :string)
  field(:port_value, 3, type: :uint32, oneof: 0)
  field(:named_port, 4, type: :string, oneof: 0)
  field(:resolver_name, 5, type: :string)
  field(:ipv4_compat, 6, type: :bool)
end

defmodule Envoy.Config.Core.V4alpha.TcpKeepalive do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:keepalive_probes, 1, type: Google.Protobuf.UInt32Value)
  field(:keepalive_time, 2, type: Google.Protobuf.UInt32Value)
  field(:keepalive_interval, 3, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Core.V4alpha.BindConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:source_address, 1, type: Envoy.Config.Core.V4alpha.SocketAddress)
  field(:freebind, 2, type: Google.Protobuf.BoolValue)
  field(:socket_options, 3, repeated: true, type: Envoy.Config.Core.V4alpha.SocketOption)
end

defmodule Envoy.Config.Core.V4alpha.Address do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:address, 0)
  field(:socket_address, 1, type: Envoy.Config.Core.V4alpha.SocketAddress, oneof: 0)
  field(:pipe, 2, type: Envoy.Config.Core.V4alpha.Pipe, oneof: 0)

  field(:envoy_internal_address, 3,
    type: Envoy.Config.Core.V4alpha.EnvoyInternalAddress,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V4alpha.CidrRange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address_prefix, 1, type: :string)
  field(:prefix_len, 2, type: Google.Protobuf.UInt32Value)
end
