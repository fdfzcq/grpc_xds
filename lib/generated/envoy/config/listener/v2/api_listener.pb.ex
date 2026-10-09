defmodule Envoy.Config.Listener.V2.ApiListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:api_listener, 1, type: Google.Protobuf.Any)
end
