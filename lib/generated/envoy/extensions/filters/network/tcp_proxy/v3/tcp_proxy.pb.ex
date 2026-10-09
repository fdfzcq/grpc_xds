defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:weight, 2, type: :uint32)
  field(:metadata_match, 3, type: Envoy.Config.Core.V3.Metadata)
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight
  )
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:hostname, 1, type: :string)
  field(:use_post, 2, type: :bool)
  field(:headers_to_add, 3, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)

  field(:weighted_clusters, 10,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster,
    oneof: 0
  )

  field(:metadata_match, 9, type: Envoy.Config.Core.V3.Metadata)
  field(:idle_timeout, 8, type: Google.Protobuf.Duration)
  field(:downstream_idle_timeout, 3, type: Google.Protobuf.Duration)
  field(:upstream_idle_timeout, 4, type: Google.Protobuf.Duration)
  field(:access_log, 5, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLog)
  field(:max_connect_attempts, 7, type: Google.Protobuf.UInt32Value)
  field(:hash_policy, 11, repeated: true, type: Envoy.Type.V3.HashPolicy)

  field(:tunneling_config, 12,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig
  )

  field(:max_downstream_connection_duration, 13, type: Google.Protobuf.Duration)
end
