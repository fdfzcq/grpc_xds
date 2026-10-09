defmodule Envoy.Config.Filter.Network.MongoProxy.V2.MongoProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
  field(:delay, 3, type: Envoy.Config.Filter.Fault.V2.FaultDelay)
  field(:emit_dynamic_metadata, 4, type: :bool)
end
