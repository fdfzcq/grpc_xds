defmodule Envoy.Admin.V4alpha.ServerInfo.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:LIVE, 0)
  field(:DRAINING, 1)
  field(:PRE_INITIALIZING, 2)
  field(:INITIALIZING, 3)
end

defmodule Envoy.Admin.V4alpha.CommandLineOptions.IpVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:v4, 0)
  field(:v6, 1)
end

defmodule Envoy.Admin.V4alpha.CommandLineOptions.Mode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Serve, 0)
  field(:Validate, 1)
  field(:InitOnly, 2)
end

defmodule Envoy.Admin.V4alpha.CommandLineOptions.DrainStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Gradual, 0)
  field(:Immediate, 1)
end

defmodule Envoy.Admin.V4alpha.ServerInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:version, 1, type: :string)
  field(:state, 2, type: Envoy.Admin.V4alpha.ServerInfo.State, enum: true)
  field(:uptime_current_epoch, 3, type: Google.Protobuf.Duration)
  field(:uptime_all_epochs, 4, type: Google.Protobuf.Duration)
  field(:hot_restart_version, 5, type: :string)
  field(:command_line_options, 6, type: Envoy.Admin.V4alpha.CommandLineOptions)
  field(:node, 7, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Admin.V4alpha.CommandLineOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:base_id, 1, type: :uint64)
  field(:use_dynamic_base_id, 31, type: :bool)
  field(:base_id_path, 32, type: :string)
  field(:concurrency, 2, type: :uint32)
  field(:config_path, 3, type: :string)
  field(:config_yaml, 4, type: :string)
  field(:allow_unknown_static_fields, 5, type: :bool)
  field(:reject_unknown_dynamic_fields, 26, type: :bool)
  field(:ignore_unknown_dynamic_fields, 30, type: :bool)
  field(:admin_address_path, 6, type: :string)

  field(:local_address_ip_version, 7,
    type: Envoy.Admin.V4alpha.CommandLineOptions.IpVersion,
    enum: true
  )

  field(:log_level, 8, type: :string)
  field(:component_log_level, 9, type: :string)
  field(:log_format, 10, type: :string)
  field(:log_format_escaped, 27, type: :bool)
  field(:log_path, 11, type: :string)
  field(:service_cluster, 13, type: :string)
  field(:service_node, 14, type: :string)
  field(:service_zone, 15, type: :string)
  field(:file_flush_interval, 16, type: Google.Protobuf.Duration)
  field(:drain_time, 17, type: Google.Protobuf.Duration)

  field(:drain_strategy, 33,
    type: Envoy.Admin.V4alpha.CommandLineOptions.DrainStrategy,
    enum: true
  )

  field(:parent_shutdown_time, 18, type: Google.Protobuf.Duration)
  field(:mode, 19, type: Envoy.Admin.V4alpha.CommandLineOptions.Mode, enum: true)
  field(:disable_hot_restart, 22, type: :bool)
  field(:enable_mutex_tracing, 23, type: :bool)
  field(:restart_epoch, 24, type: :uint32)
  field(:cpuset_threads, 25, type: :bool)
  field(:disabled_extensions, 28, repeated: true, type: :string)
  field(:bootstrap_version, 29, type: :uint32)
  field(:enable_fine_grain_logging, 34, type: :bool)
  field(:socket_path, 35, type: :string)
  field(:socket_mode, 36, type: :uint32)
end
