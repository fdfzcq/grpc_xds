defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:per_method_stat_specifier, 0)
  field(:emit_filter_state, 1, type: :bool)
  field(:individual_method_stats_allowlist, 2, type: Envoy.Api.V2.Core.GrpcMethodList, oneof: 0)
  field(:stats_for_all_methods, 3, type: Google.Protobuf.BoolValue, oneof: 0)
end

defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterObject do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:request_message_count, 1, type: :uint64)
  field(:response_message_count, 2, type: :uint64)
end
