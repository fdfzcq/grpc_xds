defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, type: Envoy.Config.Rbac.V3.RBAC)
  field(:shadow_rules, 2, type: Envoy.Config.Rbac.V3.RBAC)
end

defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBACPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rbac, 2, type: Envoy.Extensions.Filters.Http.Rbac.V3.RBAC)
end
