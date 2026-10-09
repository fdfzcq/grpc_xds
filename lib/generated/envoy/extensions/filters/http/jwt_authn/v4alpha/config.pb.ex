defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:jwks_source_specifier, 0)
  field(:issuer, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)

  field(:remote_jwks, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RemoteJwks,
    oneof: 0
  )

  field(:local_jwks, 4, type: Envoy.Config.Core.V4alpha.DataSource, oneof: 0)
  field(:forward, 5, type: :bool)

  field(:from_headers, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtHeader
  )

  field(:from_params, 7, repeated: true, type: :string)
  field(:forward_payload_header, 8, type: :string)
  field(:payload_in_metadata, 9, type: :string)
  field(:clock_skew_seconds, 10, type: :uint32)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RemoteJwks do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:http_uri, 1, type: Envoy.Config.Core.V4alpha.HttpUri)
  field(:cache_duration, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:value_prefix, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.ProviderWithAudiences do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:provider_name, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:requires_type, 0)
  field(:provider_name, 1, type: :string, oneof: 0)

  field(:provider_and_audiences, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.ProviderWithAudiences,
    oneof: 0
  )

  field(:requires_any, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementOrList,
    oneof: 0
  )

  field(:requires_all, 4,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementAndList,
    oneof: 0
  )

  field(:allow_missing_or_failed, 5, type: Google.Protobuf.Empty, oneof: 0)
  field(:allow_missing, 6, type: Google.Protobuf.Empty, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementOrList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementAndList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RequirementRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:requirement_type, 0)
  field(:match, 1, type: Envoy.Config.Route.V4alpha.RouteMatch)

  field(:requires, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement,
    oneof: 0
  )

  field(:requirement_name, 3, type: :string, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule.RequiresEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)

  field(:requires, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule.RequiresEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.ProvidersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.RequirementMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:providers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.ProvidersEntry,
    map: true
  )

  field(:rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RequirementRule
  )

  field(:filter_state_rules, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule
  )

  field(:bypass_cors_preflight, 4, type: :bool)

  field(:requirement_map, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.RequirementMapEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:requirement_specifier, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:requirement_name, 2, type: :string, oneof: 0)
end
