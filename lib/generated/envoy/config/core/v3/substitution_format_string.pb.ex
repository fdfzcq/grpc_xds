defmodule Envoy.Config.Core.V3.SubstitutionFormatString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:format, 0)
  field(:text_format, 1, type: :string, deprecated: true, oneof: 0)
  field(:json_format, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:text_format_source, 5, type: Envoy.Config.Core.V3.DataSource, oneof: 0)
  field(:omit_empty_values, 3, type: :bool)
  field(:content_type, 4, type: :string)
  field(:formatters, 6, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end
