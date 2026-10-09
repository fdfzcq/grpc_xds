defmodule Envoy.Api.V2.Listener.DrainType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:MODIFY_ONLY, 1)
end

defmodule Envoy.Api.V2.Listener.DeprecatedV1 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:bind_to_port, 1, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:balance_type, 0)

  field(:exact_balance, 1,
    type: Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance,
    oneof: 0
  )
end

defmodule Envoy.Api.V2.Listener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:address, 2, type: Envoy.Api.V2.Core.Address)
  field(:filter_chains, 3, repeated: true, type: Envoy.Api.V2.Listener.FilterChain)
  field(:use_original_dst, 4, type: Google.Protobuf.BoolValue, deprecated: true)
  field(:per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value)
  field(:metadata, 6, type: Envoy.Api.V2.Core.Metadata)
  field(:deprecated_v1, 7, type: Envoy.Api.V2.Listener.DeprecatedV1)
  field(:drain_type, 8, type: Envoy.Api.V2.Listener.DrainType, enum: true)
  field(:listener_filters, 9, repeated: true, type: Envoy.Api.V2.Listener.ListenerFilter)
  field(:listener_filters_timeout, 15, type: Google.Protobuf.Duration)
  field(:continue_on_listener_filters_timeout, 17, type: :bool)
  field(:transparent, 10, type: Google.Protobuf.BoolValue)
  field(:freebind, 11, type: Google.Protobuf.BoolValue)
  field(:socket_options, 13, repeated: true, type: Envoy.Api.V2.Core.SocketOption)
  field(:tcp_fast_open_queue_length, 12, type: Google.Protobuf.UInt32Value)
  field(:traffic_direction, 16, type: Envoy.Api.V2.Core.TrafficDirection, enum: true)
  field(:udp_listener_config, 18, type: Envoy.Api.V2.Listener.UdpListenerConfig)
  field(:api_listener, 19, type: Envoy.Config.Listener.V2.ApiListener)
  field(:connection_balance_config, 20, type: Envoy.Api.V2.Listener.ConnectionBalanceConfig)
  field(:reuse_port, 21, type: :bool)
  field(:access_log, 22, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLog)
end
