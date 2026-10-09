defmodule Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:port_value, 1, type: :uint32)
  field(:hostname, 2, type: :string)
end

defmodule Envoy.Api.V2.Endpoint.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, type: Envoy.Api.V2.Core.Address)
  field(:health_check_config, 2, type: Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig)
  field(:hostname, 3, type: :string)
end

defmodule Envoy.Api.V2.Endpoint.LbEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:host_identifier, 0)
  field(:endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint, oneof: 0)
  field(:endpoint_name, 5, type: :string, oneof: 0)
  field(:health_status, 2, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
  field(:metadata, 3, type: Envoy.Api.V2.Core.Metadata)
  field(:load_balancing_weight, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Endpoint.LocalityLbEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Api.V2.Core.Locality)
  field(:lb_endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.LbEndpoint)
  field(:load_balancing_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:priority, 5, type: :uint32)
  field(:proximity, 6, type: Google.Protobuf.UInt32Value)
end
