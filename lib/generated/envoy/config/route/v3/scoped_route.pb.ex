defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:type, 0)
  field(:string_key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:fragments, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment
  )
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:on_demand, 4, type: :bool)
  field(:name, 1, type: :string)
  field(:route_configuration_name, 2, type: :string)
  field(:key, 3, type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key)
end
