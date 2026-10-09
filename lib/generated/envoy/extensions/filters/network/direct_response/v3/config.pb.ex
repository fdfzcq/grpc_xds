defmodule Envoy.Extensions.Filters.Network.DirectResponse.V3.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:response, 1, type: Envoy.Config.Core.V3.DataSource)
end
