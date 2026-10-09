defmodule Envoy.Config.Trace.V2alpha.XRayConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:daemon_endpoint, 1, type: Envoy.Api.V2.Core.SocketAddress)
  field(:segment_name, 2, type: :string)
  field(:sampling_rule_manifest, 3, type: Envoy.Api.V2.Core.DataSource)
end
