defmodule Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listeners, 1, repeated: true, type: Envoy.Api.V2.Listener)
  field(:clusters, 2, repeated: true, type: Envoy.Api.V2.Cluster)
  field(:secrets, 3, repeated: true, type: Envoy.Api.V2.Auth.Secret)
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:lds_config, 1, type: Envoy.Api.V2.Core.ConfigSource)
  field(:cds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
  field(:ads_config, 3, type: Envoy.Api.V2.Core.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:static_resources, 2, type: Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources)
  field(:dynamic_resources, 3, type: Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources)
  field(:cluster_manager, 4, type: Envoy.Config.Bootstrap.V2.ClusterManager)
  field(:hds_config, 14, type: Envoy.Api.V2.Core.ApiConfigSource)
  field(:flags_path, 5, type: :string)
  field(:stats_sinks, 6, repeated: true, type: Envoy.Config.Metrics.V2.StatsSink)
  field(:stats_config, 13, type: Envoy.Config.Metrics.V2.StatsConfig)
  field(:stats_flush_interval, 7, type: Google.Protobuf.Duration)
  field(:watchdog, 8, type: Envoy.Config.Bootstrap.V2.Watchdog)
  field(:tracing, 9, type: Envoy.Config.Trace.V2.Tracing)
  field(:runtime, 11, type: Envoy.Config.Bootstrap.V2.Runtime, deprecated: true)
  field(:layered_runtime, 17, type: Envoy.Config.Bootstrap.V2.LayeredRuntime)
  field(:admin, 12, type: Envoy.Config.Bootstrap.V2.Admin)
  field(:overload_manager, 15, type: Envoy.Config.Overload.V2alpha.OverloadManager)
  field(:enable_dispatcher_stats, 16, type: :bool)
  field(:header_prefix, 18, type: :string)
  field(:stats_server_version_override, 19, type: Google.Protobuf.UInt64Value)
  field(:use_tcp_for_dns_lookups, 20, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V2.Admin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:access_log_path, 1, type: :string)
  field(:profile_path, 2, type: :string)
  field(:address, 3, type: Envoy.Api.V2.Core.Address)
  field(:socket_options, 4, repeated: true, type: Envoy.Api.V2.Core.SocketOption)
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:event_log_path, 1, type: :string)
  field(:event_service, 2, type: Envoy.Api.V2.Core.EventServiceConfig)
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:local_cluster_name, 1, type: :string)
  field(:outlier_detection, 2, type: Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection)
  field(:upstream_bind_config, 3, type: Envoy.Api.V2.Core.BindConfig)
  field(:load_stats_config, 4, type: Envoy.Api.V2.Core.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.Watchdog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:miss_timeout, 1, type: Google.Protobuf.Duration)
  field(:megamiss_timeout, 2, type: Google.Protobuf.Duration)
  field(:kill_timeout, 3, type: Google.Protobuf.Duration)
  field(:multikill_timeout, 4, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Bootstrap.V2.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 2, type: :string)
  field(:override_subdirectory, 3, type: :string)
  field(:base, 4, type: Google.Protobuf.Struct)
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 3, type: :string)
  field(:append_service_cluster, 2, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:rtds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:layer_specifier, 0)
  field(:name, 1, type: :string)
  field(:static_layer, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:disk_layer, 3, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer, oneof: 0)
  field(:admin_layer, 4, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer, oneof: 0)
  field(:rtds_layer, 5, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer, oneof: 0)
end

defmodule Envoy.Config.Bootstrap.V2.LayeredRuntime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V2.RuntimeLayer)
end
