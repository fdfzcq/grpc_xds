defmodule Envoy.Extensions.Filters.Network.KafkaBroker.V3.KafkaBroker do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
end
