defmodule Envoy.Service.Auth.V4alpha.CheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:attributes, 1, type: Envoy.Service.Auth.V4alpha.AttributeContext)
end

defmodule Envoy.Service.Auth.V4alpha.DeniedHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: Envoy.Type.V3.HttpStatus)
  field(:headers, 2, repeated: true, type: Envoy.Config.Core.V4alpha.HeaderValueOption)
  field(:body, 3, type: :string)
end

defmodule Envoy.Service.Auth.V4alpha.OkHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 2, repeated: true, type: Envoy.Config.Core.V4alpha.HeaderValueOption)
  field(:headers_to_remove, 5, repeated: true, type: :string)

  field(:response_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )
end

defmodule Envoy.Service.Auth.V4alpha.CheckResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:http_response, 0)
  field(:status, 1, type: Google.Rpc.Status)
  field(:denied_response, 2, type: Envoy.Service.Auth.V4alpha.DeniedHttpResponse, oneof: 0)
  field(:ok_response, 3, type: Envoy.Service.Auth.V4alpha.OkHttpResponse, oneof: 0)
  field(:dynamic_metadata, 4, type: Google.Protobuf.Struct)
end
