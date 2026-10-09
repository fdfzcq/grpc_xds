defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.CodecType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:AUTO, 0)
  field(:HTTP1, 1)
  field(:HTTP2, 2)
  field(:HTTP3, 3)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ServerHeaderTransformation do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:OVERWRITE, 0)
  field(:APPEND_IF_ABSENT, 1)
  field(:PASS_THROUGH, 2)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ForwardClientCertDetails do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SANITIZE, 0)
  field(:FORWARD_ONLY, 1)
  field(:APPEND_FORWARD, 2)
  field(:SANITIZE_SET, 3)
  field(:ALWAYS_FORWARD_ONLY, 4)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing.OperationName do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:INGRESS, 0)
  field(:EGRESS, 1)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:operation_name, 1,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing.OperationName,
    deprecated: true,
    enum: true
  )

  field(:request_headers_for_tags, 2, repeated: true, type: :string, deprecated: true)
  field(:client_sampling, 3, type: Envoy.Type.Percent)
  field(:random_sampling, 4, type: Envoy.Type.Percent)
  field(:overall_sampling, 5, type: Envoy.Type.Percent)
  field(:verbose, 6, type: :bool)
  field(:max_path_tag_length, 7, type: Google.Protobuf.UInt32Value)
  field(:custom_tags, 8, repeated: true, type: Envoy.Type.Tracing.V2.CustomTag)
  field(:provider, 9, type: Envoy.Config.Trace.V2.Tracing.Http)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.InternalAddressConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:unix_sockets, 1, type: :bool)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.SetCurrentClientCertDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:subject, 1, type: Google.Protobuf.BoolValue)
  field(:cert, 3, type: :bool)
  field(:chain, 6, type: :bool)
  field(:dns, 4, type: :bool)
  field(:uri, 5, type: :bool)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.UpgradeConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:upgrade_type, 1, type: :string)

  field(:filters, 2,
    repeated: true,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter
  )

  field(:enabled, 3, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:route_specifier, 0)

  field(:codec_type, 1,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.CodecType,
    enum: true
  )

  field(:stat_prefix, 2, type: :string)
  field(:rds, 3, type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.Rds, oneof: 0)
  field(:route_config, 4, type: Envoy.Api.V2.RouteConfiguration, oneof: 0)

  field(:scoped_routes, 31,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes,
    oneof: 0
  )

  field(:http_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter
  )

  field(:add_user_agent, 6, type: Google.Protobuf.BoolValue)

  field(:tracing, 7,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing
  )

  field(:common_http_protocol_options, 35, type: Envoy.Api.V2.Core.HttpProtocolOptions)
  field(:http_protocol_options, 8, type: Envoy.Api.V2.Core.Http1ProtocolOptions)
  field(:http2_protocol_options, 9, type: Envoy.Api.V2.Core.Http2ProtocolOptions)
  field(:server_name, 10, type: :string)

  field(:server_header_transformation, 34,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ServerHeaderTransformation,
    enum: true
  )

  field(:max_request_headers_kb, 29, type: Google.Protobuf.UInt32Value)
  field(:idle_timeout, 11, type: Google.Protobuf.Duration, deprecated: true)
  field(:stream_idle_timeout, 24, type: Google.Protobuf.Duration)
  field(:request_timeout, 28, type: Google.Protobuf.Duration)
  field(:drain_timeout, 12, type: Google.Protobuf.Duration)
  field(:delayed_close_timeout, 26, type: Google.Protobuf.Duration)
  field(:access_log, 13, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLog)
  field(:use_remote_address, 14, type: Google.Protobuf.BoolValue)
  field(:xff_num_trusted_hops, 19, type: :uint32)

  field(:internal_address_config, 25,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.InternalAddressConfig
  )

  field(:skip_xff_append, 21, type: :bool)
  field(:via, 22, type: :string)
  field(:generate_request_id, 15, type: Google.Protobuf.BoolValue)
  field(:preserve_external_request_id, 32, type: :bool)

  field(:forward_client_cert_details, 16,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ForwardClientCertDetails,
    enum: true
  )

  field(:set_current_client_cert_details, 17,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.SetCurrentClientCertDetails
  )

  field(:proxy_100_continue, 18, type: :bool)
  field(:represent_ipv4_remote_address_as_ipv4_mapped_ipv6, 20, type: :bool)

  field(:upgrade_configs, 23,
    repeated: true,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.UpgradeConfig
  )

  field(:normalize_path, 30, type: Google.Protobuf.BoolValue)
  field(:merge_slashes, 33, type: :bool)

  field(:request_id_extension, 36,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.RequestIDExtension
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.Rds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_source, 1, type: Envoy.Api.V2.Core.ConfigSource)
  field(:route_config_name, 2, type: :string)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRouteConfigurationsList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:scoped_route_configurations, 1,
    repeated: true,
    type: Envoy.Api.V2.ScopedRouteConfiguration
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:separator, 1, type: :string)
  field(:key, 2, type: :string)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:extract_type, 0)
  field(:name, 1, type: :string)
  field(:element_separator, 2, type: :string)
  field(:index, 3, type: :uint32, oneof: 0)

  field(:element, 4,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement,
    oneof: 0
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:type, 0)

  field(:header_value_extractor, 1,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor,
    oneof: 0
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:fragments, 1,
    repeated: true,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_specifier, 0)
  field(:name, 1, type: :string)

  field(:scope_key_builder, 2,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder
  )

  field(:rds_config_source, 3, type: Envoy.Api.V2.Core.ConfigSource)

  field(:scoped_route_configurations_list, 4,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRouteConfigurationsList,
    oneof: 0
  )

  field(:scoped_rds, 5,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRds,
    oneof: 0
  )
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:scoped_rds_config_source, 1, type: Envoy.Api.V2.Core.ConfigSource)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.RequestIDExtension do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:typed_config, 1, type: Google.Protobuf.Any)
end
