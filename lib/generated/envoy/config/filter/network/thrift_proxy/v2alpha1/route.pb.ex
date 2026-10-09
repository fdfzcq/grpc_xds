defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:routes, 2, repeated: true, type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.Route)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteMatch)
  field(:route, 2, type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteAction)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:match_specifier, 0)
  field(:method_name, 1, type: :string, oneof: 0)
  field(:service_name, 2, type: :string, oneof: 0)
  field(:invert, 3, type: :bool)
  field(:headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)

  field(:weighted_clusters, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster,
    oneof: 0
  )

  field(:cluster_header, 6, type: :string, oneof: 0)
  field(:metadata_match, 3, type: Envoy.Api.V2.Core.Metadata)
  field(:rate_limits, 4, repeated: true, type: Envoy.Api.V2.Route.RateLimit)
  field(:strip_service_name, 5, type: :bool)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Api.V2.Core.Metadata)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.WeightedCluster.ClusterWeight
  )
end
