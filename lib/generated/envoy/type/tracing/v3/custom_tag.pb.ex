defmodule Envoy.Type.Tracing.V3.CustomTag.Literal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:value, 1, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Environment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:default_value, 2, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:default_value, 2, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Metadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:kind, 1, type: Envoy.Type.Metadata.V3.MetadataKind)
  field(:metadata_key, 2, type: Envoy.Type.Metadata.V3.MetadataKey)
  field(:default_value, 3, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:type, 0)
  field(:tag, 1, type: :string)
  field(:literal, 2, type: Envoy.Type.Tracing.V3.CustomTag.Literal, oneof: 0)
  field(:environment, 3, type: Envoy.Type.Tracing.V3.CustomTag.Environment, oneof: 0)
  field(:request_header, 4, type: Envoy.Type.Tracing.V3.CustomTag.Header, oneof: 0)
  field(:metadata, 5, type: Envoy.Type.Tracing.V3.CustomTag.Metadata, oneof: 0)
end
