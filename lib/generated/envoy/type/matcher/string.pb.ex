defmodule Envoy.Type.Matcher.StringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:match_pattern, 0)
  field(:exact, 1, type: :string, oneof: 0)
  field(:prefix, 2, type: :string, oneof: 0)
  field(:suffix, 3, type: :string, oneof: 0)
  field(:regex, 4, type: :string, deprecated: true, oneof: 0)
  field(:safe_regex, 5, type: Envoy.Type.Matcher.RegexMatcher, oneof: 0)
  field(:ignore_case, 6, type: :bool)
end

defmodule Envoy.Type.Matcher.ListStringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:patterns, 1, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
end
