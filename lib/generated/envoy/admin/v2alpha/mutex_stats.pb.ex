defmodule Envoy.Admin.V2alpha.MutexStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:num_contentions, 1, type: :uint64)
  field(:current_wait_cycles, 2, type: :uint64)
  field(:lifetime_wait_cycles, 3, type: :uint64)
end
