defmodule Envoy.Service.Discovery.V2.Capability.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:REDIS, 2)
end

defmodule Envoy.Service.Discovery.V2.Capability do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.Capability.Protocol,
    enum: true
  )
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:capability, 2, type: Envoy.Service.Discovery.V2.Capability)
end

defmodule Envoy.Service.Discovery.V2.EndpointHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint)
  field(:health_status, 2, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
end

defmodule Envoy.Service.Discovery.V2.EndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:endpoints_health, 1, repeated: true, type: Envoy.Service.Discovery.V2.EndpointHealth)
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequestOrEndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:request_type, 0)
  field(:health_check_request, 1, type: Envoy.Service.Discovery.V2.HealthCheckRequest, oneof: 0)

  field(:endpoint_health_response, 2,
    type: Envoy.Service.Discovery.V2.EndpointHealthResponse,
    oneof: 0
  )
end

defmodule Envoy.Service.Discovery.V2.LocalityEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Api.V2.Core.Locality)
  field(:endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.Endpoint)
end

defmodule Envoy.Service.Discovery.V2.ClusterHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:health_checks, 2, repeated: true, type: Envoy.Api.V2.Core.HealthCheck)

  field(:locality_endpoints, 3,
    repeated: true,
    type: Envoy.Service.Discovery.V2.LocalityEndpoints
  )
end

defmodule Envoy.Service.Discovery.V2.HealthCheckSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.ClusterHealthCheck
  )

  field(:interval, 2, type: Google.Protobuf.Duration)
end
