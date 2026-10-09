defmodule Envoy.Config.Metrics.V2.StatsSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Metrics.V2.StatsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stats_tags, 1, repeated: true, type: Envoy.Config.Metrics.V2.TagSpecifier)
  field(:use_all_default_tags, 2, type: Google.Protobuf.BoolValue)
  field(:stats_matcher, 3, type: Envoy.Config.Metrics.V2.StatsMatcher)
end

defmodule Envoy.Config.Metrics.V2.StatsMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:stats_matcher, 0)
  field(:reject_all, 1, type: :bool, oneof: 0)
  field(:exclusion_list, 2, type: Envoy.Type.Matcher.ListStringMatcher, oneof: 0)
  field(:inclusion_list, 3, type: Envoy.Type.Matcher.ListStringMatcher, oneof: 0)
end

defmodule Envoy.Config.Metrics.V2.TagSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:tag_value, 0)
  field(:tag_name, 1, type: :string)
  field(:regex, 2, type: :string, oneof: 0)
  field(:fixed_value, 3, type: :string, oneof: 0)
end

defmodule Envoy.Config.Metrics.V2.StatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:statsd_specifier, 0)
  field(:address, 1, type: Envoy.Api.V2.Core.Address, oneof: 0)
  field(:tcp_cluster_name, 2, type: :string, oneof: 0)
  field(:prefix, 3, type: :string)
end

defmodule Envoy.Config.Metrics.V2.DogStatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:dog_statsd_specifier, 0)
  field(:address, 1, type: Envoy.Api.V2.Core.Address, oneof: 0)
  field(:prefix, 3, type: :string)
end

defmodule Envoy.Config.Metrics.V2.HystrixSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:num_buckets, 1, type: :int64)
end
