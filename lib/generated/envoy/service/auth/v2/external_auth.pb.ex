defmodule Envoy.Service.Auth.V2.CheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:attributes, 1, type: Envoy.Service.Auth.V2.AttributeContext)
end

defmodule Envoy.Service.Auth.V2.DeniedHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: Envoy.Type.HttpStatus)
  field(:headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:body, 3, type: :string)
end

defmodule Envoy.Service.Auth.V2.OkHttpResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
end

defmodule Envoy.Service.Auth.V2.CheckResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:http_response, 0)
  field(:status, 1, type: Google.Rpc.Status)
  field(:denied_response, 2, type: Envoy.Service.Auth.V2.DeniedHttpResponse, oneof: 0)
  field(:ok_response, 3, type: Envoy.Service.Auth.V2.OkHttpResponse, oneof: 0)
end
