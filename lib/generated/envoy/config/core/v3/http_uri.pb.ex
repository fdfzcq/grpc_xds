defmodule Envoy.Config.Core.V3.HttpUri do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:http_upstream_type, 0)
  field(:uri, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)
  field(:timeout, 3, type: Google.Protobuf.Duration)
end
