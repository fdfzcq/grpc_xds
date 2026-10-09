defmodule Envoy.Data.Core.V2alpha.HealthCheckFailureType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ACTIVE, 0)
  field(:PASSIVE, 1)
  field(:NETWORK, 2)
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckerType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:GRPC, 2)
  field(:REDIS, 3)
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:event, 0)
  field(:health_checker_type, 1, type: Envoy.Data.Core.V2alpha.HealthCheckerType, enum: true)
  field(:host, 2, type: Envoy.Api.V2.Core.Address)
  field(:cluster_name, 3, type: :string)

  field(:eject_unhealthy_event, 4,
    type: Envoy.Data.Core.V2alpha.HealthCheckEjectUnhealthy,
    oneof: 0
  )

  field(:add_healthy_event, 5, type: Envoy.Data.Core.V2alpha.HealthCheckAddHealthy, oneof: 0)

  field(:health_check_failure_event, 7,
    type: Envoy.Data.Core.V2alpha.HealthCheckFailure,
    oneof: 0
  )

  field(:degraded_healthy_host, 8, type: Envoy.Data.Core.V2alpha.DegradedHealthyHost, oneof: 0)
  field(:no_longer_degraded_host, 9, type: Envoy.Data.Core.V2alpha.NoLongerDegradedHost, oneof: 0)
  field(:timestamp, 6, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckEjectUnhealthy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failure_type, 1, type: Envoy.Data.Core.V2alpha.HealthCheckFailureType, enum: true)
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckAddHealthy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:first_check, 1, type: :bool)
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failure_type, 1, type: Envoy.Data.Core.V2alpha.HealthCheckFailureType, enum: true)
  field(:first_check, 2, type: :bool)
end

defmodule Envoy.Data.Core.V2alpha.DegradedHealthyHost do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Data.Core.V2alpha.NoLongerDegradedHost do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
