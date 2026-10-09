defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Dubbo, 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.SerializationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Hessian2, 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.DubboProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)

  field(:protocol_type, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.ProtocolType,
    enum: true
  )

  field(:serialization_type, 3,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.SerializationType,
    enum: true
  )

  field(:route_config, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteConfiguration
  )

  field(:dubbo_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.DubboFilter
  )
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.DubboFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Any)
end
