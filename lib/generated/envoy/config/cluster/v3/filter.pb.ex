defmodule Envoy.Config.Cluster.V3.Filter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Google.Protobuf.Any)
end
