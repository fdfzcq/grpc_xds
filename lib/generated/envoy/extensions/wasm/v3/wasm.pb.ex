defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Wasm.V3.SanitizationConfig)
end

defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:allowed_capabilities, 1,
    repeated: true,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Wasm.V3.SanitizationConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Extensions.Wasm.V3.VmConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:vm_id, 1, type: :string)
  field(:runtime, 2, type: :string)
  field(:code, 3, type: Envoy.Config.Core.V3.AsyncDataSource)
  field(:configuration, 4, type: Google.Protobuf.Any)
  field(:allow_precompiled, 5, type: :bool)
  field(:nack_on_code_cache_miss, 6, type: :bool)
end

defmodule Envoy.Extensions.Wasm.V3.PluginConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:vm, 0)
  field(:name, 1, type: :string)
  field(:root_id, 2, type: :string)
  field(:vm_config, 3, type: Envoy.Extensions.Wasm.V3.VmConfig, oneof: 0)
  field(:configuration, 4, type: Google.Protobuf.Any)
  field(:fail_open, 5, type: :bool)

  field(:capability_restriction_config, 6,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig
  )
end

defmodule Envoy.Extensions.Wasm.V3.WasmService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig)
  field(:singleton, 2, type: :bool)
end
