defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:interface, 2, type: :string)
  field(:group, 3, type: :string)
  field(:version, 4, type: :string)
  field(:routes, 5, repeated: true, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.Route)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteMatch)
  field(:route, 2, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteAction)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:method, 1, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch)
  field(:headers, 2, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:weighted_clusters, 2, type: Envoy.Api.V2.Route.WeightedCluster, oneof: 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParameterMatchSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:parameter_match_specifier, 0)
  field(:exact_match, 3, type: :string, oneof: 0)
  field(:range_match, 4, type: Envoy.Type.Int64Range, oneof: 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParamsMatchEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :uint32)

  field(:value, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParameterMatchSpecifier
  )
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: Envoy.Type.Matcher.StringMatcher)

  field(:params_match, 2,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParamsMatchEntry,
    map: true
  )
end
