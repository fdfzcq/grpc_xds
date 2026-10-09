defmodule Envoy.Extensions.ResourceMonitors.InjectedResource.V3.InjectedResourceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filename, 1, type: :string)
end
