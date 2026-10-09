defmodule Envoy.Extensions.Filters.Network.MysqlProxy.V3.MySQLProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
end
