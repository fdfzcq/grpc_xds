defmodule Envoy.Config.Retry.PreviousPriorities.PreviousPrioritiesConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:update_frequency, 1, type: :int32)
end
