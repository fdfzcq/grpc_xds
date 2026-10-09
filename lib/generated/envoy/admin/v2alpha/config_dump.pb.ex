defmodule Envoy.Admin.V2alpha.ConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:configs, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V2alpha.UpdateFailureState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:failed_configuration, 1, type: Google.Protobuf.Any)
  field(:last_update_attempt, 2, type: Google.Protobuf.Timestamp)
  field(:details, 3, type: :string)
end

defmodule Envoy.Admin.V2alpha.BootstrapConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:bootstrap, 1, type: Envoy.Config.Bootstrap.V2.Bootstrap)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listener, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:listener, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:active_state, 2, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:warming_state, 3, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:draining_state, 4, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:error_state, 5, type: Envoy.Admin.V2alpha.UpdateFailureState)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)

  field(:static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener
  )

  field(:dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener
  )
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:cluster, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)

  field(:static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster
  )

  field(:dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster
  )

  field(:dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster
  )
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:route_config, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version_info, 1, type: :string)
  field(:route_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig
  )

  field(:dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig
  )
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:scoped_route_configs, 2, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:scoped_route_configs, 3, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 4, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs
  )

  field(:dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs
  )
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:secret, 4, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
  field(:secret, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret
  )

  field(:dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret
  )

  field(:dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret
  )
end
