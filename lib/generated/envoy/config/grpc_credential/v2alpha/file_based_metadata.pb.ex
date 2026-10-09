defmodule Envoy.Config.GrpcCredential.V2alpha.FileBasedMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:secret_data, 1, type: Envoy.Api.V2.Core.DataSource)
  field(:header_key, 2, type: :string)
  field(:header_prefix, 3, type: :string)
end
