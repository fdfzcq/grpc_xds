defmodule Envoy.Service.ExtProc.V3alpha.CommonResponse.ResponseStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:CONTINUE, 0)
  field(:CONTINUE_AND_REPLACE, 1)
end

defmodule Envoy.Service.ExtProc.V3alpha.ProcessingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:request, 0)
  field(:async_mode, 1, type: :bool)
  field(:request_headers, 2, type: Envoy.Service.ExtProc.V3alpha.HttpHeaders, oneof: 0)
  field(:response_headers, 3, type: Envoy.Service.ExtProc.V3alpha.HttpHeaders, oneof: 0)
  field(:request_body, 4, type: Envoy.Service.ExtProc.V3alpha.HttpBody, oneof: 0)
  field(:response_body, 5, type: Envoy.Service.ExtProc.V3alpha.HttpBody, oneof: 0)
  field(:request_trailers, 6, type: Envoy.Service.ExtProc.V3alpha.HttpTrailers, oneof: 0)
  field(:response_trailers, 7, type: Envoy.Service.ExtProc.V3alpha.HttpTrailers, oneof: 0)
end

defmodule Envoy.Service.ExtProc.V3alpha.ProcessingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:response, 0)
  field(:request_headers, 1, type: Envoy.Service.ExtProc.V3alpha.HeadersResponse, oneof: 0)
  field(:response_headers, 2, type: Envoy.Service.ExtProc.V3alpha.HeadersResponse, oneof: 0)
  field(:request_body, 3, type: Envoy.Service.ExtProc.V3alpha.BodyResponse, oneof: 0)
  field(:response_body, 4, type: Envoy.Service.ExtProc.V3alpha.BodyResponse, oneof: 0)
  field(:request_trailers, 5, type: Envoy.Service.ExtProc.V3alpha.TrailersResponse, oneof: 0)
  field(:response_trailers, 6, type: Envoy.Service.ExtProc.V3alpha.TrailersResponse, oneof: 0)
  field(:immediate_response, 7, type: Envoy.Service.ExtProc.V3alpha.ImmediateResponse, oneof: 0)
  field(:dynamic_metadata, 8, type: Google.Protobuf.Struct)
  field(:mode_override, 9, type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode)
end

defmodule Envoy.Service.ExtProc.V3alpha.HttpHeaders.AttributesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Service.ExtProc.V3alpha.HttpHeaders do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 1, type: Envoy.Config.Core.V3.HeaderMap)

  field(:attributes, 2,
    repeated: true,
    type: Envoy.Service.ExtProc.V3alpha.HttpHeaders.AttributesEntry,
    map: true
  )

  field(:end_of_stream, 3, type: :bool)
end

defmodule Envoy.Service.ExtProc.V3alpha.HttpBody do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:body, 1, type: :bytes)
  field(:end_of_stream, 2, type: :bool)
end

defmodule Envoy.Service.ExtProc.V3alpha.HttpTrailers do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trailers, 1, type: Envoy.Config.Core.V3.HeaderMap)
end

defmodule Envoy.Service.ExtProc.V3alpha.HeadersResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:response, 1, type: Envoy.Service.ExtProc.V3alpha.CommonResponse)
end

defmodule Envoy.Service.ExtProc.V3alpha.TrailersResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_mutation, 1, type: Envoy.Service.ExtProc.V3alpha.HeaderMutation)
end

defmodule Envoy.Service.ExtProc.V3alpha.BodyResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:response, 1, type: Envoy.Service.ExtProc.V3alpha.CommonResponse)
end

defmodule Envoy.Service.ExtProc.V3alpha.CommonResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: Envoy.Service.ExtProc.V3alpha.CommonResponse.ResponseStatus, enum: true)
  field(:header_mutation, 2, type: Envoy.Service.ExtProc.V3alpha.HeaderMutation)
  field(:body_mutation, 3, type: Envoy.Service.ExtProc.V3alpha.BodyMutation)
  field(:trailers, 4, type: Envoy.Config.Core.V3.HeaderMap)
  field(:clear_route_cache, 5, type: :bool)
end

defmodule Envoy.Service.ExtProc.V3alpha.ImmediateResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: Envoy.Type.V3.HttpStatus)
  field(:headers, 2, type: Envoy.Service.ExtProc.V3alpha.HeaderMutation)
  field(:body, 3, type: :string)
  field(:grpc_status, 4, type: Envoy.Service.ExtProc.V3alpha.GrpcStatus)
  field(:details, 5, type: :string)
end

defmodule Envoy.Service.ExtProc.V3alpha.GrpcStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: :uint32)
end

defmodule Envoy.Service.ExtProc.V3alpha.HeaderMutation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:set_headers, 1, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
  field(:remove_headers, 2, repeated: true, type: :string)
end

defmodule Envoy.Service.ExtProc.V3alpha.BodyMutation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:mutation, 0)
  field(:body, 1, type: :bytes, oneof: 0)
  field(:clear_body, 2, type: :bool, oneof: 0)
end
