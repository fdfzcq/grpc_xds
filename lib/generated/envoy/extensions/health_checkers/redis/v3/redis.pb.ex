defmodule Envoy.Extensions.HealthCheckers.Redis.V3.Redis do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
end
