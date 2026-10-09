defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext.OcspStaplePolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:LENIENT_STAPLING, 0)
  field(:STRICT_STAPLING, 1)
  field(:MUST_STAPLE, 2)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.UpstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext
  )

  field(:sni, 2, type: :string)
  field(:allow_renegotiation, 3, type: :bool)
  field(:max_session_keys, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:session_ticket_keys_type, 0)

  field(:common_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext
  )

  field(:require_client_certificate, 2, type: Google.Protobuf.BoolValue)
  field(:require_sni, 3, type: Google.Protobuf.BoolValue)

  field(:session_ticket_keys, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsSessionTicketKeys,
    oneof: 0
  )

  field(:session_ticket_keys_sds_secret_config, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.SdsSecretConfig,
    oneof: 0
  )

  field(:disable_stateless_session_resumption, 7, type: :bool, oneof: 0)
  field(:session_timeout, 6, type: Google.Protobuf.Duration)

  field(:ocsp_staple_policy, 8,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext.OcspStaplePolicy,
    enum: true
  )
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProviderInstance do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:instance_name, 1, type: :string)
  field(:certificate_name, 2, type: :string)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CombinedCertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:dynamic_validation_context, 0)

  field(:default_validation_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext
  )

  field(:validation_context_sds_secret_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.SdsSecretConfig,
    oneof: 0
  )

  field(:validation_context_certificate_provider, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProvider,
    oneof: 0
  )

  field(:validation_context_certificate_provider_instance, 4,
    type:
      Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProviderInstance,
    oneof: 0
  )
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:validation_context_type, 0)
  field(:tls_params, 1, type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters)

  field(:tls_certificates, 2,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsCertificate
  )

  field(:tls_certificate_sds_secret_configs, 6,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.SdsSecretConfig
  )

  field(:tls_certificate_certificate_provider, 9,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProvider
  )

  field(:tls_certificate_certificate_provider_instance, 11,
    type:
      Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProviderInstance
  )

  field(:validation_context, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext,
    oneof: 0
  )

  field(:validation_context_sds_secret_config, 7,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.SdsSecretConfig,
    oneof: 0
  )

  field(:combined_validation_context, 8,
    type:
      Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CombinedCertificateValidationContext,
    oneof: 0
  )

  field(:validation_context_certificate_provider, 10,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProvider,
    oneof: 0
  )

  field(:validation_context_certificate_provider_instance, 12,
    type:
      Envoy.Extensions.TransportSockets.Tls.V4alpha.CommonTlsContext.CertificateProviderInstance,
    oneof: 0
  )

  field(:alpn_protocols, 4, repeated: true, type: :string)
  field(:custom_handshaker, 13, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
end
