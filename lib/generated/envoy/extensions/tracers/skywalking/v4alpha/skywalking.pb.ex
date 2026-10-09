defmodule Envoy.Extensions.Tracers.Skywalking.V4alpha.SkyWalkingConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:grpc_service, 1, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:client_config, 2, type: Envoy.Extensions.Tracers.Skywalking.V4alpha.ClientConfig)
end

defmodule Envoy.Extensions.Tracers.Skywalking.V4alpha.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:backend_token_specifier, 0)
  field(:service_name, 1, type: :string)
  field(:instance_name, 2, type: :string)
  field(:backend_token, 3, type: :string, oneof: 0)
  field(:max_cache_size, 4, type: Google.Protobuf.UInt32Value)
end
