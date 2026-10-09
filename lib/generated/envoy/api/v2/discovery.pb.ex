defmodule Envoy.Api.V2.DiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:node, 2, type: Envoy.Api.V2.Core.Node)
  field(:resource_names, 3, repeated: true, type: :string)
  field(:type_url, 4, type: :string)
  field(:response_nonce, 5, type: :string)
  field(:error_detail, 6, type: Google.Rpc.Status)
end

defmodule Envoy.Api.V2.DiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Google.Protobuf.Any)
  field(:canary, 3, type: :bool)
  field(:type_url, 4, type: :string)
  field(:nonce, 5, type: :string)
  field(:control_plane, 6, type: Envoy.Api.V2.Core.ControlPlane)
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:type_url, 2, type: :string)
  field(:resource_names_subscribe, 3, repeated: true, type: :string)
  field(:resource_names_unsubscribe, 4, repeated: true, type: :string)

  field(:initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    map: true
  )

  field(:response_nonce, 6, type: :string)
  field(:error_detail, 7, type: Google.Rpc.Status)
end

defmodule Envoy.Api.V2.DeltaDiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:system_version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Envoy.Api.V2.Resource)
  field(:type_url, 4, type: :string)
  field(:removed_resources, 6, repeated: true, type: :string)
  field(:nonce, 5, type: :string)
end

defmodule Envoy.Api.V2.Resource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 3, type: :string)
  field(:aliases, 4, repeated: true, type: :string)
  field(:version, 1, type: :string)
  field(:resource, 2, type: Google.Protobuf.Any)
end
