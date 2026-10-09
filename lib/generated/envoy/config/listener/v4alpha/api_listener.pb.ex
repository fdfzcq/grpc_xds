defmodule Envoy.Config.Listener.V4alpha.ApiListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:api_listener, 1, type: Google.Protobuf.Any)
end
