defmodule Envoy.Config.Filter.Http.Rbac.V2.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, type: Envoy.Config.Rbac.V2.RBAC)
  field(:shadow_rules, 2, type: Envoy.Config.Rbac.V2.RBAC)
end

defmodule Envoy.Config.Filter.Http.Rbac.V2.RBACPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rbac, 2, type: Envoy.Config.Filter.Http.Rbac.V2.RBAC)
end
