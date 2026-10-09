defmodule Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:admin_config, 1, type: Envoy.Config.Common.Tap.V2alpha.AdminConfig, oneof: 0)
  field(:static_config, 2, type: Envoy.Service.Tap.V2alpha.TapConfig, oneof: 0)
end

defmodule Envoy.Config.Common.Tap.V2alpha.AdminConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config_id, 1, type: :string)
end
