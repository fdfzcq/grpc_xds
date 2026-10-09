defmodule Envoy.Type.V3.FractionalPercent.DenominatorType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:HUNDRED, 0)
  field(:TEN_THOUSAND, 1)
  field(:MILLION, 2)
end

defmodule Envoy.Type.V3.Percent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:value, 1, type: :double)
end

defmodule Envoy.Type.V3.FractionalPercent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:numerator, 1, type: :uint32)
  field(:denominator, 2, type: Envoy.Type.V3.FractionalPercent.DenominatorType, enum: true)
end
