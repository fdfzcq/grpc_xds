defmodule Envoy.Config.Accesslog.V2.HttpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig)
  field(:additional_request_headers_to_log, 2, repeated: true, type: :string)
  field(:additional_response_headers_to_log, 3, repeated: true, type: :string)
  field(:additional_response_trailers_to_log, 4, repeated: true, type: :string)
end

defmodule Envoy.Config.Accesslog.V2.TcpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1, type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig)
end

defmodule Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:log_name, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
  field(:buffer_flush_interval, 3, type: Google.Protobuf.Duration)
  field(:buffer_size_bytes, 4, type: Google.Protobuf.UInt32Value)
  field(:filter_state_objects_to_log, 5, repeated: true, type: :string)
end
