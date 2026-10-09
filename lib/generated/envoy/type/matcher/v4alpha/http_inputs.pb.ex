defmodule Envoy.Type.Matcher.V4alpha.HttpRequestHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
end

defmodule Envoy.Type.Matcher.V4alpha.HttpResponseHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
end
