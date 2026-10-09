defmodule Envoy.Data.Dns.V2alpha.DnsTable.AddressList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:address, 1, repeated: true, type: :string)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:endpoint_config, 0)
  field(:address_list, 1, type: Envoy.Data.Dns.V2alpha.DnsTable.AddressList, oneof: 0)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:endpoint, 2, type: Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint)
  field(:answer_ttl, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:external_retry_count, 1, type: :uint32)

  field(:virtual_domains, 2,
    repeated: true,
    type: Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain
  )

  field(:known_suffixes, 3, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
end
