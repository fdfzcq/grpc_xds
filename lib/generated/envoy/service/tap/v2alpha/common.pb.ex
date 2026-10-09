defmodule Envoy.Service.Tap.V2alpha.OutputSink.Format do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:JSON_BODY_AS_BYTES, 0)
  field(:JSON_BODY_AS_STRING, 1)
  field(:PROTO_BINARY, 2)
  field(:PROTO_BINARY_LENGTH_DELIMITED, 3)
  field(:PROTO_TEXT, 4)
end

defmodule Envoy.Service.Tap.V2alpha.TapConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match_config, 1, type: Envoy.Service.Tap.V2alpha.MatchPredicate)
  field(:output_config, 2, type: Envoy.Service.Tap.V2alpha.OutputConfig)
  field(:tap_enabled, 3, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rules, 1, repeated: true, type: Envoy.Service.Tap.V2alpha.MatchPredicate)
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:rule, 0)
  field(:or_match, 1, type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet, oneof: 0)
  field(:and_match, 2, type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet, oneof: 0)
  field(:not_match, 3, type: Envoy.Service.Tap.V2alpha.MatchPredicate, oneof: 0)
  field(:any_match, 4, type: :bool, oneof: 0)

  field(:http_request_headers_match, 5,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_request_trailers_match, 6,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_headers_match, 7,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_trailers_match, 8,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )
end

defmodule Envoy.Service.Tap.V2alpha.HttpHeadersMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 1, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Service.Tap.V2alpha.OutputConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:sinks, 1, repeated: true, type: Envoy.Service.Tap.V2alpha.OutputSink)
  field(:max_buffered_rx_bytes, 2, type: Google.Protobuf.UInt32Value)
  field(:max_buffered_tx_bytes, 3, type: Google.Protobuf.UInt32Value)
  field(:streaming, 4, type: :bool)
end

defmodule Envoy.Service.Tap.V2alpha.OutputSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:output_sink_type, 0)
  field(:format, 1, type: Envoy.Service.Tap.V2alpha.OutputSink.Format, enum: true)
  field(:streaming_admin, 2, type: Envoy.Service.Tap.V2alpha.StreamingAdminSink, oneof: 0)
  field(:file_per_tap, 3, type: Envoy.Service.Tap.V2alpha.FilePerTapSink, oneof: 0)
  field(:streaming_grpc, 4, type: Envoy.Service.Tap.V2alpha.StreamingGrpcSink, oneof: 0)
end

defmodule Envoy.Service.Tap.V2alpha.StreamingAdminSink do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Tap.V2alpha.FilePerTapSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:path_prefix, 1, type: :string)
end

defmodule Envoy.Service.Tap.V2alpha.StreamingGrpcSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:tap_id, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
end
