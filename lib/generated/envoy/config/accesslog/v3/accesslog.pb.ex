defmodule Envoy.Config.Accesslog.V3.ComparisonFilter.Op do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:EQ, 0)
  field(:GE, 1)
  field(:LE, 2)
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:OK, 0)
  field(:CANCELED, 1)
  field(:UNKNOWN, 2)
  field(:INVALID_ARGUMENT, 3)
  field(:DEADLINE_EXCEEDED, 4)
  field(:NOT_FOUND, 5)
  field(:ALREADY_EXISTS, 6)
  field(:PERMISSION_DENIED, 7)
  field(:RESOURCE_EXHAUSTED, 8)
  field(:FAILED_PRECONDITION, 9)
  field(:ABORTED, 10)
  field(:OUT_OF_RANGE, 11)
  field(:UNIMPLEMENTED, 12)
  field(:INTERNAL, 13)
  field(:UNAVAILABLE, 14)
  field(:DATA_LOSS, 15)
  field(:UNAUTHENTICATED, 16)
end

defmodule Envoy.Config.Accesslog.V3.AccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:filter, 2, type: Envoy.Config.Accesslog.V3.AccessLogFilter)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Accesslog.V3.AccessLogFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:filter_specifier, 0)
  field(:status_code_filter, 1, type: Envoy.Config.Accesslog.V3.StatusCodeFilter, oneof: 0)
  field(:duration_filter, 2, type: Envoy.Config.Accesslog.V3.DurationFilter, oneof: 0)

  field(:not_health_check_filter, 3,
    type: Envoy.Config.Accesslog.V3.NotHealthCheckFilter,
    oneof: 0
  )

  field(:traceable_filter, 4, type: Envoy.Config.Accesslog.V3.TraceableFilter, oneof: 0)
  field(:runtime_filter, 5, type: Envoy.Config.Accesslog.V3.RuntimeFilter, oneof: 0)
  field(:and_filter, 6, type: Envoy.Config.Accesslog.V3.AndFilter, oneof: 0)
  field(:or_filter, 7, type: Envoy.Config.Accesslog.V3.OrFilter, oneof: 0)
  field(:header_filter, 8, type: Envoy.Config.Accesslog.V3.HeaderFilter, oneof: 0)
  field(:response_flag_filter, 9, type: Envoy.Config.Accesslog.V3.ResponseFlagFilter, oneof: 0)
  field(:grpc_status_filter, 10, type: Envoy.Config.Accesslog.V3.GrpcStatusFilter, oneof: 0)
  field(:extension_filter, 11, type: Envoy.Config.Accesslog.V3.ExtensionFilter, oneof: 0)
  field(:metadata_filter, 12, type: Envoy.Config.Accesslog.V3.MetadataFilter, oneof: 0)
end

defmodule Envoy.Config.Accesslog.V3.ComparisonFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:op, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter.Op, enum: true)
  field(:value, 2, type: Envoy.Config.Core.V3.RuntimeUInt32)
end

defmodule Envoy.Config.Accesslog.V3.StatusCodeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter)
end

defmodule Envoy.Config.Accesslog.V3.DurationFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter)
end

defmodule Envoy.Config.Accesslog.V3.NotHealthCheckFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Accesslog.V3.TraceableFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Accesslog.V3.RuntimeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:runtime_key, 1, type: :string)
  field(:percent_sampled, 2, type: Envoy.Type.V3.FractionalPercent)
  field(:use_independent_randomness, 3, type: :bool)
end

defmodule Envoy.Config.Accesslog.V3.AndFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filters, 1, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLogFilter)
end

defmodule Envoy.Config.Accesslog.V3.OrFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:filters, 2, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLogFilter)
end

defmodule Envoy.Config.Accesslog.V3.HeaderFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header, 1, type: Envoy.Config.Route.V3.HeaderMatcher)
end

defmodule Envoy.Config.Accesslog.V3.ResponseFlagFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:flags, 1, repeated: true, type: :string)
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:statuses, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status,
    enum: true
  )

  field(:exclude, 2, type: :bool)
end

defmodule Envoy.Config.Accesslog.V3.MetadataFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:matcher, 1, type: Envoy.Type.Matcher.V3.MetadataMatcher)
  field(:match_if_key_not_found, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Accesslog.V3.ExtensionFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end
