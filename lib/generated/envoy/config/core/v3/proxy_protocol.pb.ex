defmodule Envoy.Config.Core.V3.ProxyProtocolConfig.Version do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:V1, 0)
  field(:V2, 1)
end

defmodule Envoy.Config.Core.V3.ProxyProtocolConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig.Version, enum: true)
end
