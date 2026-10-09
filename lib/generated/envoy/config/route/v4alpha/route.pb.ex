defmodule Envoy.Config.Route.V4alpha.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:virtual_hosts, 2, repeated: true, type: Envoy.Config.Route.V4alpha.VirtualHost)
  field(:vhds, 9, type: Envoy.Config.Route.V4alpha.Vhds)
  field(:internal_only_headers, 3, repeated: true, type: :string)

  field(:response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:response_headers_to_remove, 5, repeated: true, type: :string)

  field(:request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:request_headers_to_remove, 8, repeated: true, type: :string)
  field(:most_specific_header_mutations_wins, 10, type: :bool)
  field(:validate_clusters, 7, type: Google.Protobuf.BoolValue)
  field(:max_direct_response_body_size_bytes, 11, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Route.V4alpha.Vhds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_source, 1, type: Envoy.Config.Core.V4alpha.ConfigSource)
end
