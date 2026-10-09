defmodule Envoy.Type.HashPolicy.SourceIp do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Type.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:policy_specifier, 0)
  field(:source_ip, 1, type: Envoy.Type.HashPolicy.SourceIp, oneof: 0)
end
