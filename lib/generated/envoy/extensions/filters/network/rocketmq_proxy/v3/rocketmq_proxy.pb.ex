defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RocketmqProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)

  field(:route_config, 2,
    type: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteConfiguration
  )

  field(:transient_object_life_span, 3, type: Google.Protobuf.Duration)
  field(:develop_mode, 4, type: :bool)
end
