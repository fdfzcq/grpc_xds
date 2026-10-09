defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: :string)
  field(:destination_ip_list, 2, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
  field(:destination_ports, 3, type: :string)
  field(:source_ip_list, 4, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
  field(:source_ports, 5, type: :string)
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1 do
  @moduledoc false
  use Protobuf, deprecated: true, syntax: :proto3

  field(:routes, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute
  )
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:weight, 2, type: :uint32)
  field(:metadata_match, 3, type: Envoy.Api.V2.Core.Metadata)
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight
  )
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:hostname, 1, type: :string)
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)

  field(:weighted_clusters, 10,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster,
    oneof: 0
  )

  field(:metadata_match, 9, type: Envoy.Api.V2.Core.Metadata)
  field(:idle_timeout, 8, type: Google.Protobuf.Duration)
  field(:downstream_idle_timeout, 3, type: Google.Protobuf.Duration)
  field(:upstream_idle_timeout, 4, type: Google.Protobuf.Duration)
  field(:access_log, 5, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLog)

  field(:deprecated_v1, 6,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1,
    deprecated: true
  )

  field(:max_connect_attempts, 7, type: Google.Protobuf.UInt32Value)
  field(:hash_policy, 11, repeated: true, type: Envoy.Type.HashPolicy)

  field(:tunneling_config, 12,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig
  )
end
