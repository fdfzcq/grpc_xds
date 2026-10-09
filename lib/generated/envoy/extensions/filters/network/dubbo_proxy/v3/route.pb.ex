defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:interface, 2, type: :string)
  field(:group, 3, type: :string)
  field(:version, 4, type: :string)
  field(:routes, 5, repeated: true, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.Route)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:method, 1, type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch)
  field(:headers, 2, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:weighted_clusters, 2, type: Envoy.Config.Route.V3.WeightedCluster, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParameterMatchSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:parameter_match_specifier, 0)
  field(:exact_match, 3, type: :string, oneof: 0)
  field(:range_match, 4, type: Envoy.Type.V3.Int64Range, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParamsMatchEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :uint32)

  field(:value, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParameterMatchSpecifier
  )
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: Envoy.Type.Matcher.V3.StringMatcher)

  field(:params_match, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MethodMatch.ParamsMatchEntry,
    map: true
  )
end
