defmodule Envoy.Service.Health.V3.Capability.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:REDIS, 2)
end

defmodule Envoy.Service.Health.V3.Capability do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.Capability.Protocol,
    enum: true
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:capability, 2, type: Envoy.Service.Health.V3.Capability)
end

defmodule Envoy.Service.Health.V3.EndpointHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint)
  field(:health_status, 2, type: Envoy.Config.Core.V3.HealthStatus, enum: true)
end

defmodule Envoy.Service.Health.V3.LocalityEndpointsHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:endpoints_health, 2, repeated: true, type: Envoy.Service.Health.V3.EndpointHealth)
end

defmodule Envoy.Service.Health.V3.ClusterEndpointsHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)

  field(:locality_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpointsHealth
  )
end

defmodule Envoy.Service.Health.V3.EndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:endpoints_health, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    deprecated: true
  )

  field(:cluster_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterEndpointsHealth
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:request_type, 0)
  field(:health_check_request, 1, type: Envoy.Service.Health.V3.HealthCheckRequest, oneof: 0)

  field(:endpoint_health_response, 2,
    type: Envoy.Service.Health.V3.EndpointHealthResponse,
    oneof: 0
  )
end

defmodule Envoy.Service.Health.V3.LocalityEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.Endpoint)
end

defmodule Envoy.Service.Health.V3.ClusterHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:health_checks, 2, repeated: true, type: Envoy.Config.Core.V3.HealthCheck)
  field(:locality_endpoints, 3, repeated: true, type: Envoy.Service.Health.V3.LocalityEndpoints)

  field(:transport_socket_matches, 4,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterHealthCheck
  )

  field(:interval, 2, type: Google.Protobuf.Duration)
end
