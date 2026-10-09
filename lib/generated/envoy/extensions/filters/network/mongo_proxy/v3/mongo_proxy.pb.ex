defmodule Envoy.Extensions.Filters.Network.MongoProxy.V3.MongoProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
  field(:delay, 3, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay)
  field(:emit_dynamic_metadata, 4, type: :bool)
  field(:commands, 5, repeated: true, type: :string)
end
