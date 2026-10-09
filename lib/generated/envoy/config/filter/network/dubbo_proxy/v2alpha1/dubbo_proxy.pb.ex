defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Dubbo, 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Hessian2, 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)

  field(:protocol_type, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType,
    enum: true
  )

  field(:serialization_type, 3,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType,
    enum: true
  )

  field(:route_config, 4,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration
  )

  field(:dubbo_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter
  )
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Any)
end
