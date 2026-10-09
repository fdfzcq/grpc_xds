defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:services, 0)
  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, oneof: 0)
  field(:http_service, 3, type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService, oneof: 0)
  field(:transport_api_version, 12, type: Envoy.Config.Core.V3.ApiVersion, enum: true)
  field(:failure_mode_allow, 2, type: :bool)
  field(:with_request_body, 5, type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings)
  field(:clear_route_cache, 6, type: :bool)
  field(:status_on_error, 7, type: Envoy.Type.V3.HttpStatus)
  field(:metadata_context_namespaces, 8, repeated: true, type: :string)
  field(:filter_enabled, 9, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:filter_enabled_metadata, 14, type: Envoy.Type.Matcher.V3.MetadataMatcher)
  field(:deny_at_disable, 11, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
  field(:include_peer_certificate, 10, type: :bool)
  field(:stat_prefix, 13, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_request_bytes, 1, type: :uint32)
  field(:allow_partial_message, 2, type: :bool)
  field(:pack_as_bytes, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:server_uri, 1, type: Envoy.Config.Core.V3.HttpUri)
  field(:path_prefix, 2, type: :string)

  field(:authorization_request, 7,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest
  )

  field(:authorization_response, 8,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_headers, 1, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:headers_to_add, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_upstream_headers, 1, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_upstream_headers_to_append, 3, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_client_headers, 2, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_client_headers_on_success, 4, type: Envoy.Type.Matcher.V3.ListStringMatcher)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthzPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)

  field(:check_settings, 2,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:context_extensions, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry,
    map: true
  )

  field(:disable_request_body_buffering, 2, type: :bool)
end
