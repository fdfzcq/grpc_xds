defmodule Envoy.Type.Matcher.V3.StringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:match_pattern, 0)
  field(:exact, 1, type: :string, oneof: 0)
  field(:prefix, 2, type: :string, oneof: 0)
  field(:suffix, 3, type: :string, oneof: 0)
  field(:safe_regex, 5, type: Envoy.Type.Matcher.V3.RegexMatcher, oneof: 0)
  field(:contains, 7, type: :string, oneof: 0)
  field(:ignore_case, 6, type: :bool)
end

defmodule Envoy.Type.Matcher.V3.ListStringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:patterns, 1, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)
end
