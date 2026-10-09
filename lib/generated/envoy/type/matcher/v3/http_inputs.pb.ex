defmodule Envoy.Type.Matcher.V3.HttpRequestHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
end

defmodule Envoy.Type.Matcher.V3.HttpResponseHeaderMatchInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
end
