defmodule Envoy.Config.Filter.Network.MysqlProxy.V1alpha1.MySQLProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
end
