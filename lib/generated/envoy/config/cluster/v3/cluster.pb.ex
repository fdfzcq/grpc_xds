defmodule Envoy.Config.Cluster.V3.Cluster.DiscoveryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:STATIC, 0)
  field(:STRICT_DNS, 1)
  field(:LOGICAL_DNS, 2)
  field(:EDS, 3)
  field(:ORIGINAL_DST, 4)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ROUND_ROBIN, 0)
  field(:LEAST_REQUEST, 1)
  field(:RING_HASH, 2)
  field(:RANDOM, 3)
  field(:MAGLEV, 5)
  field(:CLUSTER_PROVIDED, 6)
  field(:LOAD_BALANCING_POLICY_CONFIG, 7)
end

defmodule Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:AUTO, 0)
  field(:V4_ONLY, 1)
  field(:V6_ONLY, 2)
end

defmodule Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:USE_CONFIGURED_PROTOCOL, 0)
  field(:USE_DOWNSTREAM_PROTOCOL, 1)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:NO_FALLBACK, 0)
  field(:ANY_ENDPOINT, 1)
  field(:DEFAULT_SUBSET, 2)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:NOT_DEFINED, 0)
  field(:NO_FALLBACK, 1)
  field(:ANY_ENDPOINT, 2)
  field(:DEFAULT_SUBSET, 3)
  field(:KEYS_SUBSET, 4)
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:XX_HASH, 0)
  field(:MURMUR_HASH_2, 1)
end

defmodule Envoy.Config.Cluster.V3.ClusterCollection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:entries, 1, type: Xds.Core.V3.CollectionEntry)
end

defmodule Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:match, 2, type: Google.Protobuf.Struct)
  field(:transport_socket, 3, type: Envoy.Config.Core.V3.TransportSocket)
end

defmodule Envoy.Config.Cluster.V3.Cluster.CustomClusterType do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:eds_config, 1, type: Envoy.Config.Core.V3.ConfigSource)
  field(:service_name, 2, type: :string)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:keys, 1, repeated: true, type: :string)
  field(:single_host_per_subset, 4, type: :bool)

  field(:fallback_policy, 2,
    type:
      Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    enum: true
  )

  field(:fallback_keys_subset, 3, repeated: true, type: :string)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:fallback_policy, 1,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy,
    enum: true
  )

  field(:default_subset, 2, type: Google.Protobuf.Struct)

  field(:subset_selectors, 3,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector
  )

  field(:locality_weight_aware, 4, type: :bool)
  field(:scale_locality_weight, 5, type: :bool)
  field(:panic_mode_any, 6, type: :bool)
  field(:list_as_any, 7, type: :bool)
end

defmodule Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:choice_count, 1, type: Google.Protobuf.UInt32Value)
  field(:active_request_bias, 2, type: Envoy.Config.Core.V3.RuntimeDouble)
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:minimum_ring_size, 1, type: Google.Protobuf.UInt64Value)

  field(:hash_function, 3,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction,
    enum: true
  )

  field(:maximum_ring_size, 4, type: Google.Protobuf.UInt64Value)
end

defmodule Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:table_size, 1, type: Google.Protobuf.UInt64Value)
end

defmodule Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:use_http_header, 1, type: :bool)
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:routing_enabled, 1, type: Envoy.Type.V3.Percent)
  field(:min_cluster_size, 2, type: Google.Protobuf.UInt64Value)
  field(:fail_traffic_on_panic, 3, type: :bool)
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:use_hostname_for_hashing, 1, type: :bool)
  field(:hash_balance_factor, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:locality_config_specifier, 0)
  field(:healthy_panic_threshold, 1, type: Envoy.Type.V3.Percent)

  field(:zone_aware_lb_config, 2,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig,
    oneof: 0
  )

  field(:locality_weighted_lb_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig,
    oneof: 0
  )

  field(:update_merge_window, 4, type: Google.Protobuf.Duration)
  field(:ignore_new_hosts_until_first_hc, 5, type: :bool)
  field(:close_connections_on_host_set_change, 6, type: :bool)

  field(:consistent_hashing_lb_config, 7,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig
  )
end

defmodule Envoy.Config.Cluster.V3.Cluster.RefreshRate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:base_interval, 1, type: Google.Protobuf.Duration)
  field(:max_interval, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:per_upstream_preconnect_ratio, 1, type: Google.Protobuf.DoubleValue)
  field(:predictive_preconnect_ratio, 2, type: Google.Protobuf.DoubleValue)
end

defmodule Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Cluster.V3.Cluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_discovery_type, 0)
  oneof(:lb_config, 1)

  field(:transport_socket_matches, 43,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch
  )

  field(:name, 1, type: :string)
  field(:alt_stat_name, 28, type: :string)
  field(:type, 2, type: Envoy.Config.Cluster.V3.Cluster.DiscoveryType, enum: true, oneof: 0)
  field(:cluster_type, 38, type: Envoy.Config.Cluster.V3.Cluster.CustomClusterType, oneof: 0)
  field(:eds_cluster_config, 3, type: Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig)
  field(:connect_timeout, 4, type: Google.Protobuf.Duration)
  field(:per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value)
  field(:lb_policy, 6, type: Envoy.Config.Cluster.V3.Cluster.LbPolicy, enum: true)
  field(:load_assignment, 33, type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment)
  field(:health_checks, 8, repeated: true, type: Envoy.Config.Core.V3.HealthCheck)
  field(:max_requests_per_connection, 9, type: Google.Protobuf.UInt32Value)
  field(:circuit_breakers, 10, type: Envoy.Config.Cluster.V3.CircuitBreakers)

  field(:upstream_http_protocol_options, 46,
    type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions,
    deprecated: true
  )

  field(:common_http_protocol_options, 29,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    deprecated: true
  )

  field(:http_protocol_options, 13,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    deprecated: true
  )

  field(:http2_protocol_options, 14,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    deprecated: true
  )

  field(:typed_extension_protocol_options, 36,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry,
    map: true
  )

  field(:dns_refresh_rate, 16, type: Google.Protobuf.Duration)
  field(:dns_failure_refresh_rate, 44, type: Envoy.Config.Cluster.V3.Cluster.RefreshRate)
  field(:respect_dns_ttl, 39, type: :bool)
  field(:dns_lookup_family, 17, type: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily, enum: true)
  field(:dns_resolvers, 18, repeated: true, type: Envoy.Config.Core.V3.Address)
  field(:use_tcp_for_dns_lookups, 45, type: :bool)
  field(:outlier_detection, 19, type: Envoy.Config.Cluster.V3.OutlierDetection)
  field(:cleanup_interval, 20, type: Google.Protobuf.Duration)
  field(:upstream_bind_config, 21, type: Envoy.Config.Core.V3.BindConfig)
  field(:lb_subset_config, 22, type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig)

  field(:ring_hash_lb_config, 23,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig,
    oneof: 1
  )

  field(:maglev_lb_config, 52, type: Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig, oneof: 1)

  field(:original_dst_lb_config, 34,
    type: Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig,
    oneof: 1
  )

  field(:least_request_lb_config, 37,
    type: Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig,
    oneof: 1
  )

  field(:common_lb_config, 27, type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig)
  field(:transport_socket, 24, type: Envoy.Config.Core.V3.TransportSocket)
  field(:metadata, 25, type: Envoy.Config.Core.V3.Metadata)

  field(:protocol_selection, 26,
    type: Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection,
    deprecated: true,
    enum: true
  )

  field(:upstream_connection_options, 30, type: Envoy.Config.Cluster.V3.UpstreamConnectionOptions)
  field(:close_connections_on_host_health_failure, 31, type: :bool)
  field(:ignore_health_on_host_removal, 32, type: :bool)
  field(:filters, 40, repeated: true, type: Envoy.Config.Cluster.V3.Filter)
  field(:load_balancing_policy, 41, type: Envoy.Config.Cluster.V3.LoadBalancingPolicy)
  field(:lrs_server, 42, type: Envoy.Config.Core.V3.ConfigSource)
  field(:track_timeout_budgets, 47, type: :bool, deprecated: true)
  field(:upstream_config, 48, type: Envoy.Config.Core.V3.TypedExtensionConfig)
  field(:track_cluster_stats, 49, type: Envoy.Config.Cluster.V3.TrackClusterStats)
  field(:preconnect_policy, 50, type: Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy)
  field(:connection_pool_per_downstream_connection, 51, type: :bool)
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:policies, 1, repeated: true, type: Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy)
end

defmodule Envoy.Config.Cluster.V3.UpstreamBindConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:source_address, 1, type: Envoy.Config.Core.V3.Address)
end

defmodule Envoy.Config.Cluster.V3.UpstreamConnectionOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:tcp_keepalive, 1, type: Envoy.Config.Core.V3.TcpKeepalive)
end

defmodule Envoy.Config.Cluster.V3.TrackClusterStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:timeout_budgets, 1, type: :bool)
  field(:request_response_sizes, 2, type: :bool)
end
