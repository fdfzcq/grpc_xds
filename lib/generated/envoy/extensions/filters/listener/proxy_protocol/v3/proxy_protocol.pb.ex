defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:metadata_namespace, 1, type: :string)
  field(:key, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:tlv_type, 1, type: :uint32)

  field(:on_tlv_present, 2,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair
  )
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule
  )
end
