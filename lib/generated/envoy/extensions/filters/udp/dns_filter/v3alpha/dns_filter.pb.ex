defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3alpha.DnsFilterConfig.ServerContextConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_source, 0)
  field(:inline_dns_table, 1, type: Envoy.Data.Dns.V3.DnsTable, oneof: 0)
  field(:external_dns_table, 2, type: Envoy.Config.Core.V3.DataSource, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3alpha.DnsFilterConfig.ClientContextConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:resolver_timeout, 1, type: Google.Protobuf.Duration)
  field(:upstream_resolvers, 2, repeated: true, type: Envoy.Config.Core.V3.Address)
  field(:max_pending_lookups, 3, type: :uint64)
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3alpha.DnsFilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)

  field(:server_config, 2,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3alpha.DnsFilterConfig.ServerContextConfig
  )

  field(:client_config, 3,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3alpha.DnsFilterConfig.ClientContextConfig
  )
end
