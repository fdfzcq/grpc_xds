defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:content_type, 1, type: :string)
  field(:withhold_grpc_frames, 2, type: :bool)
end

defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfigPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:disabled, 1, type: :bool)
end
