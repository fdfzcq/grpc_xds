defmodule Envoy.Extensions.Filters.Http.Rbac.V4alpha.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, type: Envoy.Config.Rbac.V4alpha.RBAC)
  field(:shadow_rules, 2, type: Envoy.Config.Rbac.V4alpha.RBAC)
end

defmodule Envoy.Extensions.Filters.Http.Rbac.V4alpha.RBACPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rbac, 2, type: Envoy.Extensions.Filters.Http.Rbac.V4alpha.RBAC)
end
