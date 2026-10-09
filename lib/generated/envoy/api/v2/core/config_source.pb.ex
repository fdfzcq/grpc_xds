defmodule Envoy.Api.V2.Core.ApiVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:AUTO, 0)
  field(:V2, 1)
  field(:V3, 2)
end

defmodule Envoy.Api.V2.Core.ApiConfigSource.ApiType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNSUPPORTED_REST_LEGACY, 0)
  field(:REST, 1)
  field(:GRPC, 2)
  field(:DELTA_GRPC, 3)
end

defmodule Envoy.Api.V2.Core.ApiConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:api_type, 1, type: Envoy.Api.V2.Core.ApiConfigSource.ApiType, enum: true)
  field(:transport_api_version, 8, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
  field(:cluster_names, 2, repeated: true, type: :string)
  field(:grpc_services, 4, repeated: true, type: Envoy.Api.V2.Core.GrpcService)
  field(:refresh_delay, 3, type: Google.Protobuf.Duration)
  field(:request_timeout, 5, type: Google.Protobuf.Duration)
  field(:rate_limit_settings, 6, type: Envoy.Api.V2.Core.RateLimitSettings)
  field(:set_node_on_first_message_only, 7, type: :bool)
end

defmodule Envoy.Api.V2.Core.AggregatedConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Core.SelfConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:transport_api_version, 1, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
end

defmodule Envoy.Api.V2.Core.RateLimitSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:max_tokens, 1, type: Google.Protobuf.UInt32Value)
  field(:fill_rate, 2, type: Google.Protobuf.DoubleValue)
end

defmodule Envoy.Api.V2.Core.ConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_source_specifier, 0)
  field(:path, 1, type: :string, oneof: 0)
  field(:api_config_source, 2, type: Envoy.Api.V2.Core.ApiConfigSource, oneof: 0)
  field(:ads, 3, type: Envoy.Api.V2.Core.AggregatedConfigSource, oneof: 0)
  field(:self, 5, type: Envoy.Api.V2.Core.SelfConfigSource, oneof: 0)
  field(:initial_fetch_timeout, 4, type: Google.Protobuf.Duration)
  field(:resource_api_version, 6, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
end
