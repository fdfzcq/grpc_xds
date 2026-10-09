defmodule Envoy.Service.Trace.V4alpha.StreamTracesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Trace.V4alpha.StreamTracesMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Service.Trace.V4alpha.StreamTracesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Envoy.Service.Trace.V4alpha.StreamTracesMessage.Identifier)
  field(:spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span)
end
