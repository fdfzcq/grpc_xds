defmodule Envoy.Config.Bootstrap.V4alpha.Watchdog.WatchdogAction.WatchdogEvent do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:KILL, 1)
  field(:MULTIKILL, 2)
  field(:MEGAMISS, 3)
  field(:MISS, 4)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Bootstrap.StaticResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listeners, 1, repeated: true, type: Envoy.Config.Listener.V4alpha.Listener)
  field(:clusters, 2, repeated: true, type: Envoy.Config.Cluster.V4alpha.Cluster)
  field(:secrets, 3, repeated: true, type: Envoy.Extensions.TransportSockets.Tls.V4alpha.Secret)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Bootstrap.DynamicResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:lds_config, 1, type: Envoy.Config.Core.V4alpha.ConfigSource)
  field(:lds_resources_locator, 5, type: :string)
  field(:cds_config, 2, type: Envoy.Config.Core.V4alpha.ConfigSource)
  field(:cds_resources_locator, 6, type: :string)
  field(:ads_config, 3, type: Envoy.Config.Core.V4alpha.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Bootstrap.CertificateProviderInstancesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Bootstrap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:stats_flush, 0)
  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
  field(:node_context_params, 26, repeated: true, type: :string)
  field(:static_resources, 2, type: Envoy.Config.Bootstrap.V4alpha.Bootstrap.StaticResources)
  field(:dynamic_resources, 3, type: Envoy.Config.Bootstrap.V4alpha.Bootstrap.DynamicResources)
  field(:cluster_manager, 4, type: Envoy.Config.Bootstrap.V4alpha.ClusterManager)
  field(:hds_config, 14, type: Envoy.Config.Core.V4alpha.ApiConfigSource)
  field(:flags_path, 5, type: :string)
  field(:stats_sinks, 6, repeated: true, type: Envoy.Config.Metrics.V4alpha.StatsSink)
  field(:stats_config, 13, type: Envoy.Config.Metrics.V4alpha.StatsConfig)
  field(:stats_flush_interval, 7, type: Google.Protobuf.Duration, oneof: 0)
  field(:stats_flush_on_admin, 29, type: :bool, oneof: 0)
  field(:watchdogs, 27, type: Envoy.Config.Bootstrap.V4alpha.Watchdogs)
  field(:layered_runtime, 17, type: Envoy.Config.Bootstrap.V4alpha.LayeredRuntime)
  field(:admin, 12, type: Envoy.Config.Bootstrap.V4alpha.Admin)
  field(:overload_manager, 15, type: Envoy.Config.Overload.V3.OverloadManager)
  field(:enable_dispatcher_stats, 16, type: :bool)
  field(:header_prefix, 18, type: :string)
  field(:stats_server_version_override, 19, type: Google.Protobuf.UInt64Value)
  field(:use_tcp_for_dns_lookups, 20, type: :bool)

  field(:bootstrap_extensions, 21,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.TypedExtensionConfig
  )

  field(:fatal_actions, 28, repeated: true, type: Envoy.Config.Bootstrap.V4alpha.FatalAction)
  field(:config_sources, 22, repeated: true, type: Envoy.Config.Core.V4alpha.ConfigSource)
  field(:default_config_source, 23, type: Envoy.Config.Core.V4alpha.ConfigSource)
  field(:default_socket_interface, 24, type: :string)

  field(:certificate_provider_instances, 25,
    repeated: true,
    type: Envoy.Config.Bootstrap.V4alpha.Bootstrap.CertificateProviderInstancesEntry,
    map: true
  )
end

defmodule Envoy.Config.Bootstrap.V4alpha.Admin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:access_log_path, 1, type: :string)
  field(:profile_path, 2, type: :string)
  field(:address, 3, type: Envoy.Config.Core.V4alpha.Address)
  field(:socket_options, 4, repeated: true, type: Envoy.Config.Core.V4alpha.SocketOption)
end

defmodule Envoy.Config.Bootstrap.V4alpha.ClusterManager.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:event_log_path, 1, type: :string)
  field(:event_service, 2, type: Envoy.Config.Core.V4alpha.EventServiceConfig)
end

defmodule Envoy.Config.Bootstrap.V4alpha.ClusterManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:local_cluster_name, 1, type: :string)

  field(:outlier_detection, 2,
    type: Envoy.Config.Bootstrap.V4alpha.ClusterManager.OutlierDetection
  )

  field(:upstream_bind_config, 3, type: Envoy.Config.Core.V4alpha.BindConfig)
  field(:load_stats_config, 4, type: Envoy.Config.Core.V4alpha.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Watchdogs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:main_thread_watchdog, 1, type: Envoy.Config.Bootstrap.V4alpha.Watchdog)
  field(:worker_watchdog, 2, type: Envoy.Config.Bootstrap.V4alpha.Watchdog)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Watchdog.WatchdogAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)

  field(:event, 2,
    type: Envoy.Config.Bootstrap.V4alpha.Watchdog.WatchdogAction.WatchdogEvent,
    enum: true
  )
end

defmodule Envoy.Config.Bootstrap.V4alpha.Watchdog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:actions, 7, repeated: true, type: Envoy.Config.Bootstrap.V4alpha.Watchdog.WatchdogAction)
  field(:miss_timeout, 1, type: Google.Protobuf.Duration)
  field(:megamiss_timeout, 2, type: Google.Protobuf.Duration)
  field(:kill_timeout, 3, type: Google.Protobuf.Duration)
  field(:max_kill_timeout_jitter, 6, type: Google.Protobuf.Duration)
  field(:multikill_timeout, 4, type: Google.Protobuf.Duration)
  field(:multikill_threshold, 5, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Config.Bootstrap.V4alpha.FatalAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:config, 1, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V4alpha.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 2, type: :string)
  field(:override_subdirectory, 3, type: :string)
  field(:base, 4, type: Google.Protobuf.Struct)
end

defmodule Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.DiskLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 3, type: :string)
  field(:append_service_cluster, 2, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.AdminLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.RtdsLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:rtds_config, 2, type: Envoy.Config.Core.V4alpha.ConfigSource)
end

defmodule Envoy.Config.Bootstrap.V4alpha.RuntimeLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:layer_specifier, 0)
  field(:name, 1, type: :string)
  field(:static_layer, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:disk_layer, 3, type: Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.DiskLayer, oneof: 0)
  field(:admin_layer, 4, type: Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.AdminLayer, oneof: 0)
  field(:rtds_layer, 5, type: Envoy.Config.Bootstrap.V4alpha.RuntimeLayer.RtdsLayer, oneof: 0)
end

defmodule Envoy.Config.Bootstrap.V4alpha.LayeredRuntime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V4alpha.RuntimeLayer)
end
