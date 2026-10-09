defmodule Envoy.Config.Core.V4alpha.ApiVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0)
  field(:V3, 2)
end

defmodule Envoy.Config.Core.V4alpha.ApiConfigSource.ApiType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0)
  field(:REST, 1)
  field(:GRPC, 2)
  field(:DELTA_GRPC, 3)
  field(:AGGREGATED_GRPC, 5)
  field(:AGGREGATED_DELTA_GRPC, 6)
end

defmodule Envoy.Config.Core.V4alpha.ApiConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:api_type, 1, type: Envoy.Config.Core.V4alpha.ApiConfigSource.ApiType, enum: true)
  field(:transport_api_version, 8, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
  field(:cluster_names, 2, repeated: true, type: :string)
  field(:grpc_services, 4, repeated: true, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:refresh_delay, 3, type: Google.Protobuf.Duration)
  field(:request_timeout, 5, type: Google.Protobuf.Duration)
  field(:rate_limit_settings, 6, type: Envoy.Config.Core.V4alpha.RateLimitSettings)
  field(:set_node_on_first_message_only, 7, type: :bool)
end

defmodule Envoy.Config.Core.V4alpha.AggregatedConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Core.V4alpha.SelfConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:transport_api_version, 1, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
end

defmodule Envoy.Config.Core.V4alpha.RateLimitSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_tokens, 1, type: Google.Protobuf.UInt32Value)
  field(:fill_rate, 2, type: Google.Protobuf.DoubleValue)
end

defmodule Envoy.Config.Core.V4alpha.ConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_source_specifier, 0)
  field(:authorities, 7, repeated: true, type: Xds.Core.V3.Authority)
  field(:path, 1, type: :string, oneof: 0)
  field(:api_config_source, 2, type: Envoy.Config.Core.V4alpha.ApiConfigSource, oneof: 0)
  field(:ads, 3, type: Envoy.Config.Core.V4alpha.AggregatedConfigSource, oneof: 0)
  field(:self, 5, type: Envoy.Config.Core.V4alpha.SelfConfigSource, oneof: 0)
  field(:initial_fetch_timeout, 4, type: Google.Protobuf.Duration)
  field(:resource_api_version, 6, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
end
