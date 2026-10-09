defmodule Xds.Core.V3.ResourceName do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:id, 1, type: :string)
  field(:authority, 2, type: :string)
  field(:resource_type, 3, type: :string)
  field(:context, 4, type: Xds.Core.V3.ContextParams)
end
