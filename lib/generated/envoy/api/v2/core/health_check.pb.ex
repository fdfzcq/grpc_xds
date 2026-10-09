defmodule Envoy.Api.V2.Core.HealthStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:HEALTHY, 1)
  field(:UNHEALTHY, 2)
  field(:DRAINING, 3)
  field(:TIMEOUT, 4)
  field(:DEGRADED, 5)
end

defmodule Envoy.Api.V2.Core.HealthCheck.Payload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:payload, 0)
  field(:text, 1, type: :string, oneof: 0)
  field(:binary, 2, type: :bytes, oneof: 0)
end

defmodule Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:host, 1, type: :string)
  field(:path, 2, type: :string)
  field(:send, 3, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:receive, 4, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:service_name, 5, type: :string, deprecated: true)
  field(:request_headers_to_add, 6, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 8, repeated: true, type: :string)
  field(:use_http2, 7, type: :bool, deprecated: true)
  field(:expected_statuses, 9, repeated: true, type: Envoy.Type.Int64Range)
  field(:codec_client_type, 10, type: Envoy.Type.CodecClientType, enum: true)
  field(:service_name_matcher, 11, type: Envoy.Type.Matcher.StringMatcher)
end

defmodule Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:send, 1, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:receive, 2, repeated: true, type: Envoy.Api.V2.Core.HealthCheck.Payload)
end

defmodule Envoy.Api.V2.Core.HealthCheck.RedisHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
end

defmodule Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:service_name, 1, type: :string)
  field(:authority, 2, type: :string)
end

defmodule Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Core.HealthCheck.TlsOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:alpn_protocols, 1, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Core.HealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:health_checker, 0)
  field(:timeout, 1, type: Google.Protobuf.Duration)
  field(:interval, 2, type: Google.Protobuf.Duration)
  field(:initial_jitter, 20, type: Google.Protobuf.Duration)
  field(:interval_jitter, 3, type: Google.Protobuf.Duration)
  field(:interval_jitter_percent, 18, type: :uint32)
  field(:unhealthy_threshold, 4, type: Google.Protobuf.UInt32Value)
  field(:healthy_threshold, 5, type: Google.Protobuf.UInt32Value)
  field(:alt_port, 6, type: Google.Protobuf.UInt32Value)
  field(:reuse_connection, 7, type: Google.Protobuf.BoolValue)
  field(:http_health_check, 8, type: Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck, oneof: 0)
  field(:tcp_health_check, 9, type: Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck, oneof: 0)
  field(:grpc_health_check, 11, type: Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck, oneof: 0)
  field(:custom_health_check, 13, type: Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck, oneof: 0)
  field(:no_traffic_interval, 12, type: Google.Protobuf.Duration)
  field(:unhealthy_interval, 14, type: Google.Protobuf.Duration)
  field(:unhealthy_edge_interval, 15, type: Google.Protobuf.Duration)
  field(:healthy_edge_interval, 16, type: Google.Protobuf.Duration)
  field(:event_log_path, 17, type: :string)
  field(:event_service, 22, type: Envoy.Api.V2.Core.EventServiceConfig)
  field(:always_log_health_check_failures, 19, type: :bool)
  field(:tls_options, 21, type: Envoy.Api.V2.Core.HealthCheck.TlsOptions)
end
