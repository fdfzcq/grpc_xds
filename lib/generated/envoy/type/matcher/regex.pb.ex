defmodule Envoy.Type.Matcher.RegexMatcher.GoogleRE2 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_program_size, 1, type: Google.Protobuf.UInt32Value, deprecated: true)
end

defmodule Envoy.Type.Matcher.RegexMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:engine_type, 0)
  field(:google_re2, 1, type: Envoy.Type.Matcher.RegexMatcher.GoogleRE2, oneof: 0)
  field(:regex, 2, type: :string)
end

defmodule Envoy.Type.Matcher.RegexMatchAndSubstitute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:pattern, 1, type: Envoy.Type.Matcher.RegexMatcher)
  field(:substitution, 2, type: :string)
end
