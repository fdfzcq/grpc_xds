defmodule Envoy.Service.Tap.V3.StreamTapsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:tap_id, 2, type: :string)
end

defmodule Envoy.Service.Tap.V3.StreamTapsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Envoy.Service.Tap.V3.StreamTapsRequest.Identifier)
  field(:trace_id, 2, type: :uint64)
  field(:trace, 3, type: Envoy.Data.Tap.V3.TraceWrapper)
end

defmodule Envoy.Service.Tap.V3.StreamTapsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
