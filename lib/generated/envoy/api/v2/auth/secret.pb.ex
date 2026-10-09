defmodule Envoy.Api.V2.Auth.GenericSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:secret, 1, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Auth.SdsSecretConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:sds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
end

defmodule Envoy.Api.V2.Auth.Secret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:type, 0)
  field(:name, 1, type: :string)
  field(:tls_certificate, 2, type: Envoy.Api.V2.Auth.TlsCertificate, oneof: 0)
  field(:session_ticket_keys, 3, type: Envoy.Api.V2.Auth.TlsSessionTicketKeys, oneof: 0)
  field(:validation_context, 4, type: Envoy.Api.V2.Auth.CertificateValidationContext, oneof: 0)
  field(:generic_secret, 5, type: Envoy.Api.V2.Auth.GenericSecret, oneof: 0)
end
