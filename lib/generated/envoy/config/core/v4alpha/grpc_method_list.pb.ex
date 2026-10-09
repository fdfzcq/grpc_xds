defmodule Envoy.Config.Core.V4alpha.GrpcMethodList.Service do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:method_names, 2, repeated: true, type: :string)
end

defmodule Envoy.Config.Core.V4alpha.GrpcMethodList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:services, 1, repeated: true, type: Envoy.Config.Core.V4alpha.GrpcMethodList.Service)
end
