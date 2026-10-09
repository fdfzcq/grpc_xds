defmodule Envoy.Type.Matcher.V4alpha.StructMatcher.PathSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:segment, 0)
  field(:key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Type.Matcher.V4alpha.StructMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:path, 2, repeated: true, type: Envoy.Type.Matcher.V4alpha.StructMatcher.PathSegment)
  field(:value, 3, type: Envoy.Type.Matcher.V4alpha.ValueMatcher)
end
