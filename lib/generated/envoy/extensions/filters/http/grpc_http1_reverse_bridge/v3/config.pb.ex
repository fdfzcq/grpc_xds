defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:content_type, 1, type: :string)
  field(:withhold_grpc_frames, 2, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfigPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:disabled, 1, type: :bool)
end
