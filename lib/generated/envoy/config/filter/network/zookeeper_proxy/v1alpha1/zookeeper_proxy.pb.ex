defmodule Envoy.Config.Filter.Network.ZookeeperProxy.V1alpha1.ZooKeeperProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
  field(:max_packet_bytes, 3, type: Google.Protobuf.UInt32Value)
end
