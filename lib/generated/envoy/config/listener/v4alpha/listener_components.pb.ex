defmodule Envoy.Config.Listener.V4alpha.FilterChainMatch.ConnectionSourceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ANY, 0)
  field(:SAME_IP_OR_LOOPBACK, 1)
  field(:EXTERNAL, 2)
end

defmodule Envoy.Config.Listener.V4alpha.Filter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
  field(:config_discovery, 5, type: Envoy.Config.Core.V4alpha.ExtensionConfigSource, oneof: 0)
end

defmodule Envoy.Config.Listener.V4alpha.FilterChainMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:destination_port, 8, type: Google.Protobuf.UInt32Value)
  field(:prefix_ranges, 3, repeated: true, type: Envoy.Config.Core.V4alpha.CidrRange)
  field(:address_suffix, 4, type: :string)
  field(:suffix_len, 5, type: Google.Protobuf.UInt32Value)

  field(:source_type, 12,
    type: Envoy.Config.Listener.V4alpha.FilterChainMatch.ConnectionSourceType,
    enum: true
  )

  field(:source_prefix_ranges, 6, repeated: true, type: Envoy.Config.Core.V4alpha.CidrRange)
  field(:source_ports, 7, repeated: true, type: :uint32)
  field(:server_names, 11, repeated: true, type: :string)
  field(:transport_protocol, 9, type: :string)
  field(:application_protocols, 10, repeated: true, type: :string)
end

defmodule Envoy.Config.Listener.V4alpha.FilterChain.OnDemandConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rebuild_timeout, 1, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Listener.V4alpha.FilterChain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter_chain_match, 1, type: Envoy.Config.Listener.V4alpha.FilterChainMatch)
  field(:filters, 3, repeated: true, type: Envoy.Config.Listener.V4alpha.Filter)
  field(:metadata, 5, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:transport_socket, 6, type: Envoy.Config.Core.V4alpha.TransportSocket)
  field(:transport_socket_connect_timeout, 9, type: Google.Protobuf.Duration)
  field(:name, 7, type: :string)

  field(:on_demand_configuration, 8,
    type: Envoy.Config.Listener.V4alpha.FilterChain.OnDemandConfiguration
  )
end

defmodule Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1,
    repeated: true,
    type: Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate
  )
end

defmodule Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:rule, 0)

  field(:or_match, 1,
    type: Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate.MatchSet,
    oneof: 0
  )

  field(:and_match, 2,
    type: Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate.MatchSet,
    oneof: 0
  )

  field(:not_match, 3,
    type: Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate,
    oneof: 0
  )

  field(:any_match, 4, type: :bool, oneof: 0)
  field(:destination_port_range, 5, type: Envoy.Type.V3.Int32Range, oneof: 0)
end

defmodule Envoy.Config.Listener.V4alpha.ListenerFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)

  field(:filter_disabled, 4,
    type: Envoy.Config.Listener.V4alpha.ListenerFilterChainMatchPredicate
  )
end
