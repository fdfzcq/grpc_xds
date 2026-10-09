defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.SPIFFECertValidatorConfig.TrustDomain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:trust_bundle, 2, type: Envoy.Config.Core.V4alpha.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.SPIFFECertValidatorConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trust_domains, 1,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.SPIFFECertValidatorConfig.TrustDomain
  )
end
