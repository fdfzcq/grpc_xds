defmodule Envoy.Type.Matcher.V3.NodeMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node_id, 1, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:node_metadatas, 2, repeated: true, type: Envoy.Type.Matcher.V3.StructMatcher)
end
