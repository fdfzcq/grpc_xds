defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)

  field(:routes, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.Route
  )
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:match_specifier, 0)
  field(:method_name, 1, type: :string, oneof: 0)
  field(:service_name, 2, type: :string, oneof: 0)
  field(:invert, 3, type: :bool)
  field(:headers, 4, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)

  field(:weighted_clusters, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster,
    oneof: 0
  )

  field(:cluster_header, 6, type: :string, oneof: 0)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:rate_limits, 4, repeated: true, type: Envoy.Config.Route.V4alpha.RateLimit)
  field(:strip_service_name, 5, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster.ClusterWeight
  )
end
