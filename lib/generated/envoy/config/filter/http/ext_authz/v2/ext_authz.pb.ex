defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:services, 0)
  field(:grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, oneof: 0)
  field(:http_service, 3, type: Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService, oneof: 0)
  field(:failure_mode_allow, 2, type: :bool)
  field(:use_alpha, 4, type: :bool, deprecated: true)
  field(:with_request_body, 5, type: Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings)
  field(:clear_route_cache, 6, type: :bool)
  field(:status_on_error, 7, type: Envoy.Type.HttpStatus)
  field(:metadata_context_namespaces, 8, repeated: true, type: :string)
  field(:filter_enabled, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:deny_at_disable, 11, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
  field(:include_peer_certificate, 10, type: :bool)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_request_bytes, 1, type: :uint32)
  field(:allow_partial_message, 2, type: :bool)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:server_uri, 1, type: Envoy.Api.V2.Core.HttpUri)
  field(:path_prefix, 2, type: :string)

  field(:authorization_request, 7,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest
  )

  field(:authorization_response, 8,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse
  )
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_headers, 1, type: Envoy.Type.Matcher.ListStringMatcher)
  field(:headers_to_add, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_upstream_headers, 1, type: Envoy.Type.Matcher.ListStringMatcher)
  field(:allowed_client_headers, 2, type: Envoy.Type.Matcher.ListStringMatcher)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthzPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:check_settings, 2, type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings, oneof: 0)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:context_extensions, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry,
    map: true
  )
end
