defmodule Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ALLOW, 0)
  field(:REJECT_REQUEST, 1)
  field(:DROP_HEADER, 2)
end

defmodule Envoy.Config.Core.V3.TcpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Core.V3.UpstreamHttpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:auto_sni, 1, type: :bool)
  field(:auto_san_validation, 2, type: :bool)
end

defmodule Envoy.Config.Core.V3.HttpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:idle_timeout, 1, type: Google.Protobuf.Duration)
  field(:max_connection_duration, 3, type: Google.Protobuf.Duration)
  field(:max_headers_count, 2, type: Google.Protobuf.UInt32Value)
  field(:max_stream_duration, 4, type: Google.Protobuf.Duration)

  field(:headers_with_underscores_action, 5,
    type: Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction,
    enum: true
  )
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:header_format, 0)

  field(:proper_case_words, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allow_absolute_url, 1, type: Google.Protobuf.BoolValue)
  field(:accept_http_10, 2, type: :bool)
  field(:default_host_for_http_10, 3, type: :string)
  field(:header_key_format, 4, type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat)
  field(:enable_trailers, 5, type: :bool)
  field(:allow_chunked_length, 6, type: :bool)
  field(:override_stream_error_on_invalid_http_message, 7, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Core.V3.KeepaliveSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:interval, 1, type: Google.Protobuf.Duration)
  field(:timeout, 2, type: Google.Protobuf.Duration)
  field(:interval_jitter, 3, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Google.Protobuf.UInt32Value)
  field(:value, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:hpack_table_size, 1, type: Google.Protobuf.UInt32Value)
  field(:max_concurrent_streams, 2, type: Google.Protobuf.UInt32Value)
  field(:initial_stream_window_size, 3, type: Google.Protobuf.UInt32Value)
  field(:initial_connection_window_size, 4, type: Google.Protobuf.UInt32Value)
  field(:allow_connect, 5, type: :bool)
  field(:allow_metadata, 6, type: :bool)
  field(:max_outbound_frames, 7, type: Google.Protobuf.UInt32Value)
  field(:max_outbound_control_frames, 8, type: Google.Protobuf.UInt32Value)
  field(:max_consecutive_inbound_frames_with_empty_payload, 9, type: Google.Protobuf.UInt32Value)
  field(:max_inbound_priority_frames_per_stream, 10, type: Google.Protobuf.UInt32Value)

  field(:max_inbound_window_update_frames_per_data_frame_sent, 11,
    type: Google.Protobuf.UInt32Value
  )

  field(:stream_error_on_invalid_http_messaging, 12, type: :bool, deprecated: true)
  field(:override_stream_error_on_invalid_http_message, 14, type: Google.Protobuf.BoolValue)

  field(:custom_settings_parameters, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter
  )

  field(:connection_keepalive, 15, type: Envoy.Config.Core.V3.KeepaliveSettings)
end

defmodule Envoy.Config.Core.V3.GrpcProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:http2_protocol_options, 1, type: Envoy.Config.Core.V3.Http2ProtocolOptions)
end

defmodule Envoy.Config.Core.V3.Http3ProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
