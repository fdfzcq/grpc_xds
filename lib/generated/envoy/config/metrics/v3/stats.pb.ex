defmodule Envoy.Config.Metrics.V3.StatsSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.StatsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stats_tags, 1, repeated: true, type: Envoy.Config.Metrics.V3.TagSpecifier)
  field(:use_all_default_tags, 2, type: Google.Protobuf.BoolValue)
  field(:stats_matcher, 3, type: Envoy.Config.Metrics.V3.StatsMatcher)

  field(:histogram_bucket_settings, 4,
    repeated: true,
    type: Envoy.Config.Metrics.V3.HistogramBucketSettings
  )
end

defmodule Envoy.Config.Metrics.V3.StatsMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:stats_matcher, 0)
  field(:reject_all, 1, type: :bool, oneof: 0)
  field(:exclusion_list, 2, type: Envoy.Type.Matcher.V3.ListStringMatcher, oneof: 0)
  field(:inclusion_list, 3, type: Envoy.Type.Matcher.V3.ListStringMatcher, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.TagSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:tag_value, 0)
  field(:tag_name, 1, type: :string)
  field(:regex, 2, type: :string, oneof: 0)
  field(:fixed_value, 3, type: :string, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.HistogramBucketSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:match, 1, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:buckets, 2, repeated: true, type: :double)
end

defmodule Envoy.Config.Metrics.V3.StatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:statsd_specifier, 0)
  field(:address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0)
  field(:tcp_cluster_name, 2, type: :string, oneof: 0)
  field(:prefix, 3, type: :string)
end

defmodule Envoy.Config.Metrics.V3.DogStatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:dog_statsd_specifier, 0)
  field(:address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0)
  field(:prefix, 3, type: :string)
  field(:max_bytes_per_datagram, 4, type: Google.Protobuf.UInt64Value)
end

defmodule Envoy.Config.Metrics.V3.HystrixSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:num_buckets, 1, type: :int64)
end
