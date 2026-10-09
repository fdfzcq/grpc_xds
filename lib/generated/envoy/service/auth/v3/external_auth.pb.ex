defmodule Envoy.Service.Auth.V3.CheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:attributes, 1, type: Envoy.Service.Auth.V3.AttributeContext)
end

defmodule Envoy.Service.Auth.V3.DeniedHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: Envoy.Type.V3.HttpStatus)
  field(:headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
  field(:body, 3, type: :string)
end

defmodule Envoy.Service.Auth.V3.OkHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
  field(:headers_to_remove, 5, repeated: true, type: :string)
  field(:dynamic_metadata, 3, type: Google.Protobuf.Struct, deprecated: true)
  field(:response_headers_to_add, 6, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
end

defmodule Envoy.Service.Auth.V3.CheckResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:http_response, 0)
  field(:status, 1, type: Google.Rpc.Status)
  field(:denied_response, 2, type: Envoy.Service.Auth.V3.DeniedHttpResponse, oneof: 0)
  field(:ok_response, 3, type: Envoy.Service.Auth.V3.OkHttpResponse, oneof: 0)
  field(:dynamic_metadata, 4, type: Google.Protobuf.Struct)
end
