defmodule Envoy.Config.GrpcCredential.V3.FileBasedMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:secret_data, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:header_key, 2, type: :string)
  field(:header_prefix, 3, type: :string)
end
