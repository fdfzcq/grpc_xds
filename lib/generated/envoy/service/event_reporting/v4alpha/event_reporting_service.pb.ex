defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Envoy.Service.EventReporting.V4alpha.StreamEventsRequest.Identifier)
  field(:events, 2, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end
