defmodule Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:port_value, 1, type: :uint32)
  field(:hostname, 2, type: :string)
end

defmodule Envoy.Config.Endpoint.V3.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Config.Core.V3.Address)
  field(:health_check_config, 2, type: Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig)
  field(:hostname, 3, type: :string)
end

defmodule Envoy.Config.Endpoint.V3.LbEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:host_identifier, 0)
  field(:endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint, oneof: 0)
  field(:endpoint_name, 5, type: :string, oneof: 0)
  field(:health_status, 2, type: Envoy.Config.Core.V3.HealthStatus, enum: true)
  field(:metadata, 3, type: Envoy.Config.Core.V3.Metadata)
  field(:load_balancing_weight, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Endpoint.V3.LocalityLbEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:lb_endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.LbEndpoint)
  field(:load_balancing_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:priority, 5, type: :uint32)
  field(:proximity, 6, type: Google.Protobuf.UInt32Value)
end
