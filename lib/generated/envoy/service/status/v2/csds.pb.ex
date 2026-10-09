defmodule Envoy.Service.Status.V2.ConfigStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:SYNCED, 1)
  field(:NOT_SENT, 2)
  field(:STALE, 3)
  field(:ERROR, 4)
end

defmodule Envoy.Service.Status.V2.ClientStatusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node_matchers, 1, repeated: true, type: Envoy.Type.Matcher.NodeMatcher)
end

defmodule Envoy.Service.Status.V2.PerXdsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:per_xds_config, 0)
  field(:status, 1, type: Envoy.Service.Status.V2.ConfigStatus, enum: true)
  field(:listener_config, 2, type: Envoy.Admin.V2alpha.ListenersConfigDump, oneof: 0)
  field(:cluster_config, 3, type: Envoy.Admin.V2alpha.ClustersConfigDump, oneof: 0)
  field(:route_config, 4, type: Envoy.Admin.V2alpha.RoutesConfigDump, oneof: 0)
  field(:scoped_route_config, 5, type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump, oneof: 0)
end

defmodule Envoy.Service.Status.V2.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:xds_config, 2, repeated: true, type: Envoy.Service.Status.V2.PerXdsConfig)
end

defmodule Envoy.Service.Status.V2.ClientStatusResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, repeated: true, type: Envoy.Service.Status.V2.ClientConfig)
end
