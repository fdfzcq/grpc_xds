defmodule Envoy.Config.Filter.Network.DirectResponse.V2.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:response, 1, type: Envoy.Api.V2.Core.DataSource)
end
