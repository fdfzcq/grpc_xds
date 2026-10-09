defmodule Envoy.Extensions.Filters.Http.Oauth2.V3alpha.OAuth2Credentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:token_formation, 0)
  field(:client_id, 1, type: :string)
  field(:token_secret, 2, type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig)
  field(:hmac_secret, 3, type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3alpha.OAuth2Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:token_endpoint, 1, type: Envoy.Config.Core.V3.HttpUri)
  field(:authorization_endpoint, 2, type: :string)
  field(:credentials, 3, type: Envoy.Extensions.Filters.Http.Oauth2.V3alpha.OAuth2Credentials)
  field(:redirect_uri, 4, type: :string)
  field(:redirect_path_matcher, 5, type: Envoy.Type.Matcher.V3.PathMatcher)
  field(:signout_path, 6, type: Envoy.Type.Matcher.V3.PathMatcher)
  field(:forward_bearer_token, 7, type: :bool)
  field(:pass_through_matcher, 8, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher)
  field(:auth_scopes, 9, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3alpha.OAuth2 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Extensions.Filters.Http.Oauth2.V3alpha.OAuth2Config)
end
