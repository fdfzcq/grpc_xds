defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:probability, 1, type: Envoy.Type.V3.FractionalPercent)
  field(:kill_request_header, 2, type: :string)
end
