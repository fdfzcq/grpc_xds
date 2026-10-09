defmodule Envoy.Extensions.Filters.Network.PostgresProxy.V3alpha.PostgresProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:enable_sql_parsing, 2, type: Google.Protobuf.BoolValue)
  field(:terminate_ssl, 3, type: :bool)
end
