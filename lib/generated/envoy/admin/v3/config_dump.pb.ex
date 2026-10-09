defmodule Envoy.Admin.V3.ClientResourceStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:REQUESTED, 1)
  field(:DOES_NOT_EXIST, 2)
  field(:ACKED, 3)
  field(:NACKED, 4)
end

defmodule Envoy.Admin.V3.ConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:configs, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V3.UpdateFailureState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failed_configuration, 1, type: Google.Protobuf.Any)
  field(:last_update_attempt, 2, type: Google.Protobuf.Timestamp)
  field(:details, 3, type: :string)
  field(:version_info, 4, type: :string)
end

defmodule Envoy.Admin.V3.BootstrapConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:bootstrap, 1, type: Envoy.Config.Bootstrap.V3.Bootstrap)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.StaticListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listener, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:listener, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:active_state, 2, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:warming_state, 3, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:draining_state, 4, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ListenersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)

  field(:static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.StaticListener
  )

  field(:dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListener
  )
end

defmodule Envoy.Admin.V3.ClustersConfigDump.StaticCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ClustersConfigDump.DynamicCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:cluster, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ClustersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)

  field(:static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.StaticCluster
  )

  field(:dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster
  )

  field(:dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster
  )
end

defmodule Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:route_config, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:route_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.RoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig
  )

  field(:dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig
  )
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:scoped_route_configs, 2, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:scoped_route_configs, 3, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 4, type: Google.Protobuf.Timestamp)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs
  )

  field(:dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs
  )
end

defmodule Envoy.Admin.V3.SecretsConfigDump.DynamicSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:secret, 4, type: Google.Protobuf.Any)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.SecretsConfigDump.StaticSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
  field(:secret, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V3.SecretsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:static_secrets, 1, repeated: true, type: Envoy.Admin.V3.SecretsConfigDump.StaticSecret)

  field(:dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret
  )

  field(:dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret
  )
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:endpoint_config, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:endpoint_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.EndpointsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:static_endpoint_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig
  )

  field(:dynamic_endpoint_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig
  )
end
