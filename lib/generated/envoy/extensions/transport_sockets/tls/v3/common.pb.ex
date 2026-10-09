defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:TLS_AUTO, 0)
  field(:TLSv1_0, 1)
  field(:TLSv1_1, 2)
  field(:TLSv1_2, 3)
  field(:TLSv1_3, 4)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.TrustChainVerification do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:VERIFY_TRUST_CHAIN, 0)
  field(:ACCEPT_UNTRUSTED, 1)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:tls_minimum_protocol_version, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:tls_maximum_protocol_version, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:cipher_suites, 3, repeated: true, type: :string)
  field(:ecdh_curves, 4, repeated: true, type: :string)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.PrivateKeyProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:provider_name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:certificate_chain, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:private_key, 2, type: Envoy.Config.Core.V3.DataSource)
  field(:watched_directory, 7, type: Envoy.Config.Core.V3.WatchedDirectory)

  field(:private_key_provider, 6,
    type: Envoy.Extensions.TransportSockets.Tls.V3.PrivateKeyProvider
  )

  field(:password, 3, type: Envoy.Config.Core.V3.DataSource)
  field(:ocsp_staple, 4, type: Envoy.Config.Core.V3.DataSource)
  field(:signed_certificate_timestamp, 5, repeated: true, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:keys, 1, repeated: true, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trusted_ca, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:watched_directory, 11, type: Envoy.Config.Core.V3.WatchedDirectory)
  field(:verify_certificate_spki, 3, repeated: true, type: :string)
  field(:verify_certificate_hash, 2, repeated: true, type: :string)
  field(:match_subject_alt_names, 9, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:require_signed_certificate_timestamp, 6, type: Google.Protobuf.BoolValue)
  field(:crl, 7, type: Envoy.Config.Core.V3.DataSource)
  field(:allow_expired_certificate, 8, type: :bool)

  field(:trust_chain_verification, 10,
    type:
      Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.TrustChainVerification,
    enum: true
  )

  field(:custom_validator_config, 12, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end
