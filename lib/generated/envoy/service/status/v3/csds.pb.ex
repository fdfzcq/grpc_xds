defmodule Envoy.Service.Status.V3.ConfigStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:SYNCED, 1)
  field(:NOT_SENT, 2)
  field(:STALE, 3)
  field(:ERROR, 4)
end

defmodule Envoy.Service.Status.V3.ClientConfigStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:CLIENT_UNKNOWN, 0)
  field(:CLIENT_REQUESTED, 1)
  field(:CLIENT_ACKED, 2)
  field(:CLIENT_NACKED, 3)
end

defmodule Envoy.Service.Status.V3.ClientStatusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node_matchers, 1, repeated: true, type: Envoy.Type.Matcher.V3.NodeMatcher)
  field(:node, 2, type: Envoy.Config.Core.V3.Node)
end

defmodule Envoy.Service.Status.V3.PerXdsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:per_xds_config, 0)
  field(:status, 1, type: Envoy.Service.Status.V3.ConfigStatus, enum: true)

  field(:client_status, 7,
    type: Envoy.Service.Status.V3.ClientConfigStatus,
    deprecated: true,
    enum: true
  )

  field(:listener_config, 2, type: Envoy.Admin.V3.ListenersConfigDump, oneof: 0)
  field(:cluster_config, 3, type: Envoy.Admin.V3.ClustersConfigDump, oneof: 0)
  field(:route_config, 4, type: Envoy.Admin.V3.RoutesConfigDump, oneof: 0)
  field(:scoped_route_config, 5, type: Envoy.Admin.V3.ScopedRoutesConfigDump, oneof: 0)
  field(:endpoint_config, 6, type: Envoy.Admin.V3.EndpointsConfigDump, oneof: 0)
end

defmodule Envoy.Service.Status.V3.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:xds_config, 2, repeated: true, type: Envoy.Service.Status.V3.PerXdsConfig)
end

defmodule Envoy.Service.Status.V3.ClientStatusResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, repeated: true, type: Envoy.Service.Status.V3.ClientConfig)
end
