defmodule Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:secret, 1, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:sds_config, 2, type: Envoy.Config.Core.V3.ConfigSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.Secret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:type, 0)
  field(:name, 1, type: :string)

  field(:tls_certificate, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate,
    oneof: 0
  )

  field(:session_ticket_keys, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys,
    oneof: 0
  )

  field(:validation_context, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    oneof: 0
  )

  field(:generic_secret, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret,
    oneof: 0
  )
end
