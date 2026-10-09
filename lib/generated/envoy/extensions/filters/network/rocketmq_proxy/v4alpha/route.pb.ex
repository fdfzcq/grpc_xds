defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)

  field(:routes, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.Route
  )
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:topic, 1, type: Envoy.Type.Matcher.V4alpha.StringMatcher)
  field(:headers, 2, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: :string)
  field(:metadata_match, 2, type: Envoy.Config.Core.V4alpha.Metadata)
end
