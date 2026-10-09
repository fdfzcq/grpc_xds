defmodule Envoy.Extensions.Filters.Http.Router.V4alpha.Router do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:dynamic_stats, 1, type: Google.Protobuf.BoolValue)
  field(:start_child_span, 2, type: :bool)
  field(:upstream_log, 3, repeated: true, type: Envoy.Config.Accesslog.V4alpha.AccessLog)
  field(:suppress_envoy_headers, 4, type: :bool)
  field(:strict_check_headers, 5, repeated: true, type: :string)
  field(:respect_expected_rq_timeout, 6, type: :bool)
end
