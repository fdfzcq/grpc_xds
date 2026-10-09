defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:category, 1, type: :string)
  field(:drop_percentage, 2, type: Envoy.Type.V3.FractionalPercent)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:drop_overloads, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload
  )

  field(:overprovisioning_factor, 3, type: Google.Protobuf.UInt32Value)
  field(:endpoint_stale_after, 4, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Endpoint.V3.Endpoint)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.LocalityLbEndpoints)

  field(:named_endpoints, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry,
    map: true
  )

  field(:policy, 4, type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy)
end
