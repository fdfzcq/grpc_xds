defmodule Envoy.Config.Listener.V3.ApiListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:api_listener, 1, type: Google.Protobuf.Any)
end
