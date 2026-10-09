defmodule Envoy.Config.Filter.Network.ExtAuthz.V2.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stat_prefix, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
  field(:failure_mode_allow, 3, type: :bool)
  field(:include_peer_certificate, 4, type: :bool)
end
