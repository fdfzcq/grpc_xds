defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier)
  field(:events, 2, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
