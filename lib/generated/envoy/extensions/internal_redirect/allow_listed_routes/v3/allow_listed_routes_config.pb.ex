defmodule Envoy.Extensions.InternalRedirect.AllowListedRoutes.V3.AllowListedRoutesConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_route_names, 1, repeated: true, type: :string)
end
