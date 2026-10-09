defmodule Envoy.Service.Trace.V2.StreamTracesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Trace.V2.StreamTracesMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
end

defmodule Envoy.Service.Trace.V2.StreamTracesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:identifier, 1, type: Envoy.Service.Trace.V2.StreamTracesMessage.Identifier)
  field(:spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span)
end
