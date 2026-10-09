defmodule Envoy.Extensions.Filters.Network.Rbac.V4alpha.RBAC.EnforcementType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ONE_TIME_ON_FIRST_BYTE, 0)
  field(:CONTINUOUS, 1)
end

defmodule Envoy.Extensions.Filters.Network.Rbac.V4alpha.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, type: Envoy.Config.Rbac.V4alpha.RBAC)
  field(:shadow_rules, 2, type: Envoy.Config.Rbac.V4alpha.RBAC)
  field(:stat_prefix, 3, type: :string)

  field(:enforcement_type, 4,
    type: Envoy.Extensions.Filters.Network.Rbac.V4alpha.RBAC.EnforcementType,
    enum: true
  )
end
