defmodule Envoy.Data.Accesslog.V3.HTTPAccessLogEntry.HTTPVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:PROTOCOL_UNSPECIFIED, 0)
  field(:HTTP10, 1)
  field(:HTTP11, 2)
  field(:HTTP2, 3)
  field(:HTTP3, 4)
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized.Reason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:REASON_UNSPECIFIED, 0)
  field(:EXTERNAL_SERVICE, 1)
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.TLSVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:VERSION_UNSPECIFIED, 0)
  field(:TLSv1, 1)
  field(:TLSv1_1, 2)
  field(:TLSv1_2, 3)
  field(:TLSv1_3, 4)
end

defmodule Envoy.Data.Accesslog.V3.TCPAccessLogEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_properties, 1, type: Envoy.Data.Accesslog.V3.AccessLogCommon)
  field(:connection_properties, 2, type: Envoy.Data.Accesslog.V3.ConnectionProperties)
end

defmodule Envoy.Data.Accesslog.V3.HTTPAccessLogEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_properties, 1, type: Envoy.Data.Accesslog.V3.AccessLogCommon)

  field(:protocol_version, 2,
    type: Envoy.Data.Accesslog.V3.HTTPAccessLogEntry.HTTPVersion,
    enum: true
  )

  field(:request, 3, type: Envoy.Data.Accesslog.V3.HTTPRequestProperties)
  field(:response, 4, type: Envoy.Data.Accesslog.V3.HTTPResponseProperties)
end

defmodule Envoy.Data.Accesslog.V3.ConnectionProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:received_bytes, 1, type: :uint64)
  field(:sent_bytes, 2, type: :uint64)
end

defmodule Envoy.Data.Accesslog.V3.AccessLogCommon.FilterStateObjectsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Data.Accesslog.V3.AccessLogCommon do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:sample_rate, 1, type: :double)
  field(:downstream_remote_address, 2, type: Envoy.Config.Core.V3.Address)
  field(:downstream_local_address, 3, type: Envoy.Config.Core.V3.Address)
  field(:tls_properties, 4, type: Envoy.Data.Accesslog.V3.TLSProperties)
  field(:start_time, 5, type: Google.Protobuf.Timestamp)
  field(:time_to_last_rx_byte, 6, type: Google.Protobuf.Duration)
  field(:time_to_first_upstream_tx_byte, 7, type: Google.Protobuf.Duration)
  field(:time_to_last_upstream_tx_byte, 8, type: Google.Protobuf.Duration)
  field(:time_to_first_upstream_rx_byte, 9, type: Google.Protobuf.Duration)
  field(:time_to_last_upstream_rx_byte, 10, type: Google.Protobuf.Duration)
  field(:time_to_first_downstream_tx_byte, 11, type: Google.Protobuf.Duration)
  field(:time_to_last_downstream_tx_byte, 12, type: Google.Protobuf.Duration)
  field(:upstream_remote_address, 13, type: Envoy.Config.Core.V3.Address)
  field(:upstream_local_address, 14, type: Envoy.Config.Core.V3.Address)
  field(:upstream_cluster, 15, type: :string)
  field(:response_flags, 16, type: Envoy.Data.Accesslog.V3.ResponseFlags)
  field(:metadata, 17, type: Envoy.Config.Core.V3.Metadata)
  field(:upstream_transport_failure_reason, 18, type: :string)
  field(:route_name, 19, type: :string)
  field(:downstream_direct_remote_address, 20, type: Envoy.Config.Core.V3.Address)

  field(:filter_state_objects, 21,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.AccessLogCommon.FilterStateObjectsEntry,
    map: true
  )
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:reason, 1, type: Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized.Reason, enum: true)
end

defmodule Envoy.Data.Accesslog.V3.ResponseFlags do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failed_local_healthcheck, 1, type: :bool)
  field(:no_healthy_upstream, 2, type: :bool)
  field(:upstream_request_timeout, 3, type: :bool)
  field(:local_reset, 4, type: :bool)
  field(:upstream_remote_reset, 5, type: :bool)
  field(:upstream_connection_failure, 6, type: :bool)
  field(:upstream_connection_termination, 7, type: :bool)
  field(:upstream_overflow, 8, type: :bool)
  field(:no_route_found, 9, type: :bool)
  field(:delay_injected, 10, type: :bool)
  field(:fault_injected, 11, type: :bool)
  field(:rate_limited, 12, type: :bool)
  field(:unauthorized_details, 13, type: Envoy.Data.Accesslog.V3.ResponseFlags.Unauthorized)
  field(:rate_limit_service_error, 14, type: :bool)
  field(:downstream_connection_termination, 15, type: :bool)
  field(:upstream_retry_limit_exceeded, 16, type: :bool)
  field(:stream_idle_timeout, 17, type: :bool)
  field(:invalid_envoy_request_headers, 18, type: :bool)
  field(:downstream_protocol_error, 19, type: :bool)
  field(:upstream_max_stream_duration_reached, 20, type: :bool)
  field(:response_from_cache_filter, 21, type: :bool)
  field(:no_filter_config_found, 22, type: :bool)
  field(:duration_timeout, 23, type: :bool)
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties.SubjectAltName do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:san, 0)
  field(:uri, 1, type: :string, oneof: 0)
  field(:dns, 2, type: :string, oneof: 0)
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:subject_alt_name, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties.SubjectAltName
  )

  field(:subject, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V3.TLSProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:tls_version, 1, type: Envoy.Data.Accesslog.V3.TLSProperties.TLSVersion, enum: true)
  field(:tls_cipher_suite, 2, type: Google.Protobuf.UInt32Value)
  field(:tls_sni_hostname, 3, type: :string)

  field(:local_certificate_properties, 4,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties
  )

  field(:peer_certificate_properties, 5,
    type: Envoy.Data.Accesslog.V3.TLSProperties.CertificateProperties
  )

  field(:tls_session_id, 6, type: :string)
end

defmodule Envoy.Data.Accesslog.V3.HTTPRequestProperties.RequestHeadersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V3.HTTPRequestProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:request_method, 1, type: Envoy.Config.Core.V3.RequestMethod, enum: true)
  field(:scheme, 2, type: :string)
  field(:authority, 3, type: :string)
  field(:port, 4, type: Google.Protobuf.UInt32Value)
  field(:path, 5, type: :string)
  field(:user_agent, 6, type: :string)
  field(:referer, 7, type: :string)
  field(:forwarded_for, 8, type: :string)
  field(:request_id, 9, type: :string)
  field(:original_path, 10, type: :string)
  field(:request_headers_bytes, 11, type: :uint64)
  field(:request_body_bytes, 12, type: :uint64)

  field(:request_headers, 13,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPRequestProperties.RequestHeadersEntry,
    map: true
  )
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseHeadersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseTrailersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V3.HTTPResponseProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:response_code, 1, type: Google.Protobuf.UInt32Value)
  field(:response_headers_bytes, 2, type: :uint64)
  field(:response_body_bytes, 3, type: :uint64)

  field(:response_headers, 4,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseHeadersEntry,
    map: true
  )

  field(:response_trailers, 5,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPResponseProperties.ResponseTrailersEntry,
    map: true
  )

  field(:response_code_details, 6, type: :string)
end
