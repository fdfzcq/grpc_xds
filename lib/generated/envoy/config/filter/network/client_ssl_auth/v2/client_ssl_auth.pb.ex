defmodule Envoy.Config.Filter.Network.ClientSslAuth.V2.ClientSSLAuth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:auth_api_cluster, 1, type: :string)
  field(:stat_prefix, 2, type: :string)
  field(:refresh_delay, 3, type: Google.Protobuf.Duration)
  field(:ip_white_list, 4, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
end
