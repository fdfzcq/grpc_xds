defmodule Envoy.Api.V2.Listener.FilterChainMatch.ConnectionSourceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ANY, 0)
  field(:LOCAL, 1)
  field(:EXTERNAL, 2)
end

defmodule Envoy.Api.V2.Listener.Filter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Listener.FilterChainMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:destination_port, 8, type: Google.Protobuf.UInt32Value)
  field(:prefix_ranges, 3, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
  field(:address_suffix, 4, type: :string)
  field(:suffix_len, 5, type: Google.Protobuf.UInt32Value)

  field(:source_type, 12,
    type: Envoy.Api.V2.Listener.FilterChainMatch.ConnectionSourceType,
    enum: true
  )

  field(:source_prefix_ranges, 6, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
  field(:source_ports, 7, repeated: true, type: :uint32)
  field(:server_names, 11, repeated: true, type: :string)
  field(:transport_protocol, 9, type: :string)
  field(:application_protocols, 10, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Listener.FilterChain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter_chain_match, 1, type: Envoy.Api.V2.Listener.FilterChainMatch)
  field(:tls_context, 2, type: Envoy.Api.V2.Auth.DownstreamTlsContext, deprecated: true)
  field(:filters, 3, repeated: true, type: Envoy.Api.V2.Listener.Filter)
  field(:use_proxy_proto, 4, type: Google.Protobuf.BoolValue)
  field(:metadata, 5, type: Envoy.Api.V2.Core.Metadata)
  field(:transport_socket, 6, type: Envoy.Api.V2.Core.TransportSocket)
  field(:name, 7, type: :string)
end

defmodule Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, repeated: true, type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate)
end

defmodule Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:rule, 0)

  field(:or_match, 1,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet,
    oneof: 0
  )

  field(:and_match, 2,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet,
    oneof: 0
  )

  field(:not_match, 3, type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate, oneof: 0)
  field(:any_match, 4, type: :bool, oneof: 0)
  field(:destination_port_range, 5, type: Envoy.Type.Int32Range, oneof: 0)
end

defmodule Envoy.Api.V2.Listener.ListenerFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
  field(:filter_disabled, 4, type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate)
end
