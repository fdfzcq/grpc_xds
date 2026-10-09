defmodule Envoy.Type.Matcher.V4alpha.RegexMatcher.GoogleRE2 do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.Matcher.V4alpha.RegexMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:engine_type, 0)
  field(:google_re2, 1, type: Envoy.Type.Matcher.V4alpha.RegexMatcher.GoogleRE2, oneof: 0)
  field(:regex, 2, type: :string)
end

defmodule Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:pattern, 1, type: Envoy.Type.Matcher.V4alpha.RegexMatcher)
  field(:substitution, 2, type: :string)
end
