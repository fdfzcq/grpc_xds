defmodule Envoy.Config.Filter.Udp.UdpProxy.V2alpha.UdpProxyConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:route_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)
  field(:idle_timeout, 3, type: Google.Protobuf.Duration)
end
