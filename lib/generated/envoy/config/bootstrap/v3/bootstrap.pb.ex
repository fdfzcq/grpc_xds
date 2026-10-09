defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:KILL, 1)
  field(:MULTIKILL, 2)
  field(:MEGAMISS, 3)
  field(:MISS, 4)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listeners, 1, repeated: true, type: Envoy.Config.Listener.V3.Listener)
  field(:clusters, 2, repeated: true, type: Envoy.Config.Cluster.V3.Cluster)
  field(:secrets, 3, repeated: true, type: Envoy.Extensions.TransportSockets.Tls.V3.Secret)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:lds_config, 1, type: Envoy.Config.Core.V3.ConfigSource)
  field(:lds_resources_locator, 5, type: :string)
  field(:cds_config, 2, type: Envoy.Config.Core.V3.ConfigSource)
  field(:cds_resources_locator, 6, type: :string)
  field(:ads_config, 3, type: Envoy.Config.Core.V3.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:stats_flush, 0)
  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:node_context_params, 26, repeated: true, type: :string)
  field(:static_resources, 2, type: Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources)
  field(:dynamic_resources, 3, type: Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources)
  field(:cluster_manager, 4, type: Envoy.Config.Bootstrap.V3.ClusterManager)
  field(:hds_config, 14, type: Envoy.Config.Core.V3.ApiConfigSource)
  field(:flags_path, 5, type: :string)
  field(:stats_sinks, 6, repeated: true, type: Envoy.Config.Metrics.V3.StatsSink)
  field(:stats_config, 13, type: Envoy.Config.Metrics.V3.StatsConfig)
  field(:stats_flush_interval, 7, type: Google.Protobuf.Duration)
  field(:stats_flush_on_admin, 29, type: :bool, oneof: 0)
  field(:watchdog, 8, type: Envoy.Config.Bootstrap.V3.Watchdog, deprecated: true)
  field(:watchdogs, 27, type: Envoy.Config.Bootstrap.V3.Watchdogs)
  field(:tracing, 9, type: Envoy.Config.Trace.V3.Tracing, deprecated: true)
  field(:layered_runtime, 17, type: Envoy.Config.Bootstrap.V3.LayeredRuntime)
  field(:admin, 12, type: Envoy.Config.Bootstrap.V3.Admin)
  field(:overload_manager, 15, type: Envoy.Config.Overload.V3.OverloadManager)
  field(:enable_dispatcher_stats, 16, type: :bool)
  field(:header_prefix, 18, type: :string)
  field(:stats_server_version_override, 19, type: Google.Protobuf.UInt64Value)
  field(:use_tcp_for_dns_lookups, 20, type: :bool)

  field(:bootstrap_extensions, 21,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig
  )

  field(:fatal_actions, 28, repeated: true, type: Envoy.Config.Bootstrap.V3.FatalAction)
  field(:config_sources, 22, repeated: true, type: Envoy.Config.Core.V3.ConfigSource)
  field(:default_config_source, 23, type: Envoy.Config.Core.V3.ConfigSource)
  field(:default_socket_interface, 24, type: :string)

  field(:certificate_provider_instances, 25,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry,
    map: true
  )
end

defmodule Envoy.Config.Bootstrap.V3.Admin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:access_log_path, 1, type: :string)
  field(:profile_path, 2, type: :string)
  field(:address, 3, type: Envoy.Config.Core.V3.Address)
  field(:socket_options, 4, repeated: true, type: Envoy.Config.Core.V3.SocketOption)
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:event_log_path, 1, type: :string)
  field(:event_service, 2, type: Envoy.Config.Core.V3.EventServiceConfig)
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:local_cluster_name, 1, type: :string)
  field(:outlier_detection, 2, type: Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection)
  field(:upstream_bind_config, 3, type: Envoy.Config.Core.V3.BindConfig)
  field(:load_stats_config, 4, type: Envoy.Config.Core.V3.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.Watchdogs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:main_thread_watchdog, 1, type: Envoy.Config.Bootstrap.V3.Watchdog)
  field(:worker_watchdog, 2, type: Envoy.Config.Bootstrap.V3.Watchdog)
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:event, 2,
    type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent,
    enum: true
  )
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:actions, 7, repeated: true, type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction)
  field(:miss_timeout, 1, type: Google.Protobuf.Duration)
  field(:megamiss_timeout, 2, type: Google.Protobuf.Duration)
  field(:kill_timeout, 3, type: Google.Protobuf.Duration)
  field(:max_kill_timeout_jitter, 6, type: Google.Protobuf.Duration)
  field(:multikill_timeout, 4, type: Google.Protobuf.Duration)
  field(:multikill_threshold, 5, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Config.Bootstrap.V3.FatalAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V3.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 2, type: :string)
  field(:override_subdirectory, 3, type: :string)
  field(:base, 4, type: Google.Protobuf.Struct)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 3, type: :string)
  field(:append_service_cluster, 2, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:rtds_config, 2, type: Envoy.Config.Core.V3.ConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:layer_specifier, 0)
  field(:name, 1, type: :string)
  field(:static_layer, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:disk_layer, 3, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer, oneof: 0)
  field(:admin_layer, 4, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer, oneof: 0)
  field(:rtds_layer, 5, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer, oneof: 0)
end

defmodule Envoy.Config.Bootstrap.V3.LayeredRuntime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V3.RuntimeLayer)
end
