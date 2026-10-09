defmodule Envoy.Config.Retry.OmitHostMetadata.V2.OmitHostMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:metadata_match, 1, type: Envoy.Api.V2.Core.Metadata)
end
