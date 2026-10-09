defmodule Envoy.Extensions.Filters.Http.CdnLoop.V3alpha.CdnLoopConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cdn_id, 1, type: :string)
  field(:max_allowed_occurrences, 2, type: :uint32)
end
