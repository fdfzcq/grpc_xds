defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:policy_specifier, 0)
  field(:source_ip, 1, type: :bool, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:route_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)
  field(:idle_timeout, 3, type: Google.Protobuf.Duration)
  field(:use_original_src_ip, 4, type: :bool)

  field(:hash_policies, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy
  )
end
