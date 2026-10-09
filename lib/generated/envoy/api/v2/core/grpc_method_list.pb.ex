defmodule Envoy.Api.V2.Core.GrpcMethodList.Service do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:method_names, 2, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Core.GrpcMethodList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:services, 1, repeated: true, type: Envoy.Api.V2.Core.GrpcMethodList.Service)
end
