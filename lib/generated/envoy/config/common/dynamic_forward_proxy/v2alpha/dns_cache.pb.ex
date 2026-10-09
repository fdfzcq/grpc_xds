defmodule Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:dns_lookup_family, 2, type: Envoy.Api.V2.Cluster.DnsLookupFamily, enum: true)
  field(:dns_refresh_rate, 3, type: Google.Protobuf.Duration)
  field(:host_ttl, 4, type: Google.Protobuf.Duration)
  field(:max_hosts, 5, type: Google.Protobuf.UInt32Value)
  field(:dns_failure_refresh_rate, 6, type: Envoy.Api.V2.Cluster.RefreshRate)
end
