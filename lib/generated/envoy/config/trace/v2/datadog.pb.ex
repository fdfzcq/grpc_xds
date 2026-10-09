defmodule Envoy.Config.Trace.V2.DatadogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:collector_cluster, 1, type: :string)
  field(:service_name, 2, type: :string)
end
