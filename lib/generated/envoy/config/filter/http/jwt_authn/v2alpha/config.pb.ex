defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:jwks_source_specifier, 0)
  field(:issuer, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)
  field(:remote_jwks, 3, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks, oneof: 0)
  field(:local_jwks, 4, type: Envoy.Api.V2.Core.DataSource, oneof: 0)
  field(:forward, 5, type: :bool)

  field(:from_headers, 6,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader
  )

  field(:from_params, 7, repeated: true, type: :string)
  field(:forward_payload_header, 8, type: :string)
  field(:payload_in_metadata, 9, type: :string)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:http_uri, 1, type: Envoy.Api.V2.Core.HttpUri)
  field(:cache_duration, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:value_prefix, 2, type: :string)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:provider_name, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:requires_type, 0)
  field(:provider_name, 1, type: :string, oneof: 0)

  field(:provider_and_audiences, 2,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences,
    oneof: 0
  )

  field(:requires_any, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList,
    oneof: 0
  )

  field(:requires_all, 4,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList,
    oneof: 0
  )

  field(:allow_missing_or_failed, 5, type: Google.Protobuf.Empty, oneof: 0)
  field(:allow_missing, 6, type: Google.Protobuf.Empty, oneof: 0)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Api.V2.Route.RouteMatch)
  field(:requires, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)

  field(:requires, 3,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry,
    map: true
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:providers, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry,
    map: true
  )

  field(:rules, 2,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule
  )

  field(:filter_state_rules, 3, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule)
  field(:bypass_cors_preflight, 4, type: :bool)
end
