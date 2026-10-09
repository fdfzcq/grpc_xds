defmodule Envoy.Extensions.Tracers.Xray.V4alpha.XRayConfig.SegmentFields do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:origin, 1, type: :string)
  field(:aws, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Extensions.Tracers.Xray.V4alpha.XRayConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:daemon_endpoint, 1, type: Envoy.Config.Core.V4alpha.SocketAddress)
  field(:segment_name, 2, type: :string)
  field(:sampling_rule_manifest, 3, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:segment_fields, 4, type: Envoy.Extensions.Tracers.Xray.V4alpha.XRayConfig.SegmentFields)
end
