defmodule Envoy.Service.Discovery.V2.RtdsDummy do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Discovery.V2.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:layer, 2, type: Google.Protobuf.Struct)
end
