defmodule Envoy.Config.Listener.V3.Listener.DrainType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:MODIFY_ONLY, 1)
end

defmodule Envoy.Config.Listener.V3.ListenerCollection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:entries, 1, repeated: true, type: Xds.Core.V3.CollectionEntry)
end

defmodule Envoy.Config.Listener.V3.Listener.DeprecatedV1 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:bind_to_port, 1, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:balance_type, 0)

  field(:exact_balance, 1,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance,
    oneof: 0
  )
end

defmodule Envoy.Config.Listener.V3.Listener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:address, 2, type: Envoy.Config.Core.V3.Address)
  field(:filter_chains, 3, repeated: true, type: Envoy.Config.Listener.V3.FilterChain)
  field(:use_original_dst, 4, type: Google.Protobuf.BoolValue)
  field(:default_filter_chain, 25, type: Envoy.Config.Listener.V3.FilterChain)
  field(:per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value)
  field(:metadata, 6, type: Envoy.Config.Core.V3.Metadata)
  field(:deprecated_v1, 7, type: Envoy.Config.Listener.V3.Listener.DeprecatedV1, deprecated: true)
  field(:drain_type, 8, type: Envoy.Config.Listener.V3.Listener.DrainType, enum: true)
  field(:listener_filters, 9, repeated: true, type: Envoy.Config.Listener.V3.ListenerFilter)
  field(:listener_filters_timeout, 15, type: Google.Protobuf.Duration)
  field(:continue_on_listener_filters_timeout, 17, type: :bool)
  field(:transparent, 10, type: Google.Protobuf.BoolValue)
  field(:freebind, 11, type: Google.Protobuf.BoolValue)
  field(:socket_options, 13, repeated: true, type: Envoy.Config.Core.V3.SocketOption)
  field(:tcp_fast_open_queue_length, 12, type: Google.Protobuf.UInt32Value)
  field(:traffic_direction, 16, type: Envoy.Config.Core.V3.TrafficDirection, enum: true)
  field(:udp_listener_config, 18, type: Envoy.Config.Listener.V3.UdpListenerConfig)
  field(:api_listener, 19, type: Envoy.Config.Listener.V3.ApiListener)

  field(:connection_balance_config, 20,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig
  )

  field(:reuse_port, 21, type: :bool)
  field(:access_log, 22, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLog)
  field(:udp_writer_config, 23, type: Envoy.Config.Core.V3.TypedExtensionConfig)
  field(:tcp_backlog_size, 24, type: Google.Protobuf.UInt32Value)
  field(:bind_to_port, 26, type: Google.Protobuf.BoolValue)
end
