defmodule Envoy.Type.Matcher.MetadataMatcher.PathSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:segment, 0)
  field(:key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Type.Matcher.MetadataMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filter, 1, type: :string)
  field(:path, 2, repeated: true, type: Envoy.Type.Matcher.MetadataMatcher.PathSegment)
  field(:value, 3, type: Envoy.Type.Matcher.ValueMatcher)
end
