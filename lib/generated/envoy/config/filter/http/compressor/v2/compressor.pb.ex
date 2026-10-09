defmodule Envoy.Config.Filter.Http.Compressor.V2.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:content_length, 1, type: Google.Protobuf.UInt32Value)
  field(:content_type, 2, repeated: true, type: :string)
  field(:disable_on_etag_header, 3, type: :bool)
  field(:remove_accept_encoding_header, 4, type: :bool)
  field(:runtime_enabled, 5, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
end
