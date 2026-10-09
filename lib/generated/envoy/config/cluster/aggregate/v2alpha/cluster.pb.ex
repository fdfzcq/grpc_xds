defmodule Envoy.Config.Cluster.Aggregate.V2alpha.ClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1, repeated: true, type: :string)
end
