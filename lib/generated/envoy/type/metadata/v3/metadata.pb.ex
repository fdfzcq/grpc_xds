defmodule Envoy.Type.Metadata.V3.MetadataKey.PathSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:segment, 0)
  field(:key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Type.Metadata.V3.MetadataKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
  field(:path, 2, repeated: true, type: Envoy.Type.Metadata.V3.MetadataKey.PathSegment)
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Request do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Cluster do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Host do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:kind, 0)
  field(:request, 1, type: Envoy.Type.Metadata.V3.MetadataKind.Request, oneof: 0)
  field(:route, 2, type: Envoy.Type.Metadata.V3.MetadataKind.Route, oneof: 0)
  field(:cluster, 3, type: Envoy.Type.Metadata.V3.MetadataKind.Cluster, oneof: 0)
  field(:host, 4, type: Envoy.Type.Metadata.V3.MetadataKind.Host, oneof: 0)
end
