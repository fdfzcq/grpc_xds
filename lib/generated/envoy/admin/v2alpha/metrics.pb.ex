defmodule Envoy.Admin.V2alpha.SimpleMetric.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:COUNTER, 0)
  field(:GAUGE, 1)
end

defmodule Envoy.Admin.V2alpha.SimpleMetric do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:type, 1, type: Envoy.Admin.V2alpha.SimpleMetric.Type, enum: true)
  field(:value, 2, type: :uint64)
  field(:name, 3, type: :string)
end
