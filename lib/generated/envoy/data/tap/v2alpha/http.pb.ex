defmodule Envoy.Data.Tap.V2alpha.HttpBufferedTrace.Message do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 1, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
  field(:body, 2, type: Envoy.Data.Tap.V2alpha.Body)
  field(:trailers, 3, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end

defmodule Envoy.Data.Tap.V2alpha.HttpBufferedTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:request, 1, type: Envoy.Data.Tap.V2alpha.HttpBufferedTrace.Message)
  field(:response, 2, type: Envoy.Data.Tap.V2alpha.HttpBufferedTrace.Message)
end

defmodule Envoy.Data.Tap.V2alpha.HttpStreamedTraceSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:message_piece, 0)
  field(:trace_id, 1, type: :uint64)
  field(:request_headers, 2, type: Envoy.Api.V2.Core.HeaderMap, oneof: 0)
  field(:request_body_chunk, 3, type: Envoy.Data.Tap.V2alpha.Body, oneof: 0)
  field(:request_trailers, 4, type: Envoy.Api.V2.Core.HeaderMap, oneof: 0)
  field(:response_headers, 5, type: Envoy.Api.V2.Core.HeaderMap, oneof: 0)
  field(:response_body_chunk, 6, type: Envoy.Data.Tap.V2alpha.Body, oneof: 0)
  field(:response_trailers, 7, type: Envoy.Api.V2.Core.HeaderMap, oneof: 0)
end
