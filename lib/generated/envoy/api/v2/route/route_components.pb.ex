defmodule Envoy.Api.V2.Route.VirtualHost.TlsRequirementType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:NONE, 0)
  field(:EXTERNAL_ONLY, 1)
  field(:ALL, 2)
end

defmodule Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SERVICE_UNAVAILABLE, 0)
  field(:NOT_FOUND, 1)
end

defmodule Envoy.Api.V2.Route.RouteAction.InternalRedirectAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:PASS_THROUGH_INTERNAL_REDIRECT, 0)
  field(:HANDLE_INTERNAL_REDIRECT, 1)
end

defmodule Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:MOVED_PERMANENTLY, 0)
  field(:FOUND, 1)
  field(:SEE_OTHER, 2)
  field(:TEMPORARY_REDIRECT, 3)
  field(:PERMANENT_REDIRECT, 4)
end

defmodule Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Route.VirtualHost do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:domains, 2, repeated: true, type: :string)
  field(:routes, 3, repeated: true, type: Envoy.Api.V2.Route.Route)
  field(:require_tls, 4, type: Envoy.Api.V2.Route.VirtualHost.TlsRequirementType, enum: true)
  field(:virtual_clusters, 5, repeated: true, type: Envoy.Api.V2.Route.VirtualCluster)
  field(:rate_limits, 6, repeated: true, type: Envoy.Api.V2.Route.RateLimit)
  field(:request_headers_to_add, 7, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 13, repeated: true, type: :string)
  field(:response_headers_to_add, 10, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:cors, 8, type: Envoy.Api.V2.Route.CorsPolicy)

  field(:per_filter_config, 12,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry,
    map: true
  )

  field(:include_request_attempt_count, 14, type: :bool)
  field(:include_attempt_count_in_response, 19, type: :bool)
  field(:retry_policy, 16, type: Envoy.Api.V2.Route.RetryPolicy)
  field(:retry_policy_typed_config, 20, type: Google.Protobuf.Any)
  field(:hedge_policy, 17, type: Envoy.Api.V2.Route.HedgePolicy)
  field(:per_request_buffer_limit_bytes, 18, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Route.FilterAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:action, 1, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Route.Route.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Route.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:action, 0)
  field(:name, 14, type: :string)
  field(:match, 1, type: Envoy.Api.V2.Route.RouteMatch)
  field(:route, 2, type: Envoy.Api.V2.Route.RouteAction, oneof: 0)
  field(:redirect, 3, type: Envoy.Api.V2.Route.RedirectAction, oneof: 0)
  field(:direct_response, 7, type: Envoy.Api.V2.Route.DirectResponseAction, oneof: 0)
  field(:filter_action, 17, type: Envoy.Api.V2.Route.FilterAction, oneof: 0)
  field(:metadata, 4, type: Envoy.Api.V2.Core.Metadata)
  field(:decorator, 5, type: Envoy.Api.V2.Route.Decorator)

  field(:per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry,
    map: true
  )

  field(:request_headers_to_add, 9, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 12, repeated: true, type: :string)
  field(:response_headers_to_add, 10, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:tracing, 15, type: Envoy.Api.V2.Route.Tracing)
  field(:per_request_buffer_limit_bytes, 16, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Api.V2.Core.Metadata)
  field(:request_headers_to_add, 4, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 9, repeated: true, type: :string)
  field(:response_headers_to_add, 5, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 6, repeated: true, type: :string)

  field(:per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    map: true
  )
end

defmodule Envoy.Api.V2.Route.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:clusters, 1, repeated: true, type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight)
  field(:total_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:runtime_key_prefix, 2, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:presented, 1, type: Google.Protobuf.BoolValue)
  field(:validated, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:path_specifier, 0)
  field(:prefix, 1, type: :string, oneof: 0)
  field(:path, 2, type: :string, oneof: 0)
  field(:regex, 3, type: :string, deprecated: true, oneof: 0)
  field(:safe_regex, 10, type: Envoy.Type.Matcher.RegexMatcher, oneof: 0)
  field(:case_sensitive, 4, type: Google.Protobuf.BoolValue)
  field(:runtime_fraction, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:headers, 6, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:query_parameters, 7, repeated: true, type: Envoy.Api.V2.Route.QueryParameterMatcher)
  field(:grpc, 8, type: Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions)
  field(:tls_context, 11, type: Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions)
end

defmodule Envoy.Api.V2.Route.CorsPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:enabled_specifier, 0)
  field(:allow_origin, 1, repeated: true, type: :string, deprecated: true)
  field(:allow_origin_regex, 8, repeated: true, type: :string, deprecated: true)
  field(:allow_origin_string_match, 11, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
  field(:allow_methods, 2, type: :string)
  field(:allow_headers, 3, type: :string)
  field(:expose_headers, 4, type: :string)
  field(:max_age, 5, type: :string)
  field(:allow_credentials, 6, type: Google.Protobuf.BoolValue)
  field(:enabled, 7, type: Google.Protobuf.BoolValue, deprecated: true, oneof: 0)
  field(:filter_enabled, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent, oneof: 0)
  field(:shadow_enabled, 10, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
end

defmodule Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: :string)
  field(:runtime_key, 2, type: :string, deprecated: true)
  field(:runtime_fraction, 3, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:trace_sampled, 4, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:ttl, 2, type: Google.Protobuf.Duration)
  field(:path, 3, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:source_ip, 1, type: :bool)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:policy_specifier, 0)
  field(:header, 1, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Header, oneof: 0)
  field(:cookie, 2, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie, oneof: 0)

  field(:connection_properties, 3,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties,
    oneof: 0
  )

  field(:query_parameter, 5,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter,
    oneof: 0
  )

  field(:filter_state, 6, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState, oneof: 0)
  field(:terminal, 4, type: :bool)
end

defmodule Envoy.Api.V2.Route.RouteAction.UpgradeConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:upgrade_type, 1, type: :string)
  field(:enabled, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:cluster_specifier, 0)
  oneof(:host_rewrite_specifier, 1)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:cluster_header, 2, type: :string, oneof: 0)
  field(:weighted_clusters, 3, type: Envoy.Api.V2.Route.WeightedCluster, oneof: 0)

  field(:cluster_not_found_response_code, 20,
    type: Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode,
    enum: true
  )

  field(:metadata_match, 4, type: Envoy.Api.V2.Core.Metadata)
  field(:prefix_rewrite, 5, type: :string)
  field(:regex_rewrite, 32, type: Envoy.Type.Matcher.RegexMatchAndSubstitute)
  field(:host_rewrite, 6, type: :string, oneof: 1)
  field(:auto_host_rewrite, 7, type: Google.Protobuf.BoolValue, oneof: 1)
  field(:auto_host_rewrite_header, 29, type: :string, oneof: 1)
  field(:timeout, 8, type: Google.Protobuf.Duration)
  field(:idle_timeout, 24, type: Google.Protobuf.Duration)
  field(:retry_policy, 9, type: Envoy.Api.V2.Route.RetryPolicy)
  field(:retry_policy_typed_config, 33, type: Google.Protobuf.Any)

  field(:request_mirror_policy, 10,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy,
    deprecated: true
  )

  field(:request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy
  )

  field(:priority, 11, type: Envoy.Api.V2.Core.RoutingPriority, enum: true)
  field(:rate_limits, 13, repeated: true, type: Envoy.Api.V2.Route.RateLimit)
  field(:include_vh_rate_limits, 14, type: Google.Protobuf.BoolValue)
  field(:hash_policy, 15, repeated: true, type: Envoy.Api.V2.Route.RouteAction.HashPolicy)
  field(:cors, 17, type: Envoy.Api.V2.Route.CorsPolicy)
  field(:max_grpc_timeout, 23, type: Google.Protobuf.Duration)
  field(:grpc_timeout_offset, 28, type: Google.Protobuf.Duration)
  field(:upgrade_configs, 25, repeated: true, type: Envoy.Api.V2.Route.RouteAction.UpgradeConfig)

  field(:internal_redirect_action, 26,
    type: Envoy.Api.V2.Route.RouteAction.InternalRedirectAction,
    enum: true
  )

  field(:max_internal_redirects, 31, type: Google.Protobuf.UInt32Value)
  field(:hedge_policy, 27, type: Envoy.Api.V2.Route.HedgePolicy)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryPriority do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryBackOff do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:base_interval, 1, type: Google.Protobuf.Duration)
  field(:max_interval, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Api.V2.Route.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:retry_on, 1, type: :string)
  field(:num_retries, 2, type: Google.Protobuf.UInt32Value)
  field(:per_try_timeout, 3, type: Google.Protobuf.Duration)
  field(:retry_priority, 4, type: Envoy.Api.V2.Route.RetryPolicy.RetryPriority)

  field(:retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate
  )

  field(:host_selection_retry_max_attempts, 6, type: :int64)
  field(:retriable_status_codes, 7, repeated: true, type: :uint32)
  field(:retry_back_off, 8, type: Envoy.Api.V2.Route.RetryPolicy.RetryBackOff)
  field(:retriable_headers, 9, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:retriable_request_headers, 10, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Api.V2.Route.HedgePolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:initial_requests, 1, type: Google.Protobuf.UInt32Value)
  field(:additional_request_chance, 2, type: Envoy.Type.FractionalPercent)
  field(:hedge_on_per_try_timeout, 3, type: :bool)
end

defmodule Envoy.Api.V2.Route.RedirectAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:scheme_rewrite_specifier, 0)
  oneof(:path_rewrite_specifier, 1)
  field(:https_redirect, 4, type: :bool, oneof: 0)
  field(:scheme_redirect, 7, type: :string, oneof: 0)
  field(:host_redirect, 1, type: :string)
  field(:port_redirect, 8, type: :uint32)
  field(:path_redirect, 2, type: :string, oneof: 1)
  field(:prefix_rewrite, 5, type: :string, oneof: 1)

  field(:response_code, 3,
    type: Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode,
    enum: true
  )

  field(:strip_query, 6, type: :bool)
end

defmodule Envoy.Api.V2.Route.DirectResponseAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:status, 1, type: :uint32)
  field(:body, 2, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Route.Decorator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:operation, 1, type: :string)
  field(:propagate, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:client_sampling, 1, type: Envoy.Type.FractionalPercent)
  field(:random_sampling, 2, type: Envoy.Type.FractionalPercent)
  field(:overall_sampling, 3, type: Envoy.Type.FractionalPercent)
  field(:custom_tags, 4, repeated: true, type: Envoy.Type.Tracing.V2.CustomTag)
end

defmodule Envoy.Api.V2.Route.VirtualCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:pattern, 1, type: :string, deprecated: true)
  field(:headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:name, 2, type: :string)
  field(:method, 3, type: Envoy.Api.V2.Core.RequestMethod, deprecated: true, enum: true)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.SourceCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:header_name, 1, type: :string)
  field(:descriptor_key, 2, type: :string)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.GenericKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:descriptor_value, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:descriptor_value, 1, type: :string)
  field(:expect_match, 2, type: Google.Protobuf.BoolValue)
  field(:headers, 3, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:action_specifier, 0)
  field(:source_cluster, 1, type: Envoy.Api.V2.Route.RateLimit.Action.SourceCluster, oneof: 0)

  field(:destination_cluster, 2,
    type: Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster,
    oneof: 0
  )

  field(:request_headers, 3, type: Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders, oneof: 0)
  field(:remote_address, 4, type: Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress, oneof: 0)
  field(:generic_key, 5, type: Envoy.Api.V2.Route.RateLimit.Action.GenericKey, oneof: 0)

  field(:header_value_match, 6,
    type: Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch,
    oneof: 0
  )
end

defmodule Envoy.Api.V2.Route.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stage, 1, type: Google.Protobuf.UInt32Value)
  field(:disable_key, 2, type: :string)
  field(:actions, 3, repeated: true, type: Envoy.Api.V2.Route.RateLimit.Action)
end

defmodule Envoy.Api.V2.Route.HeaderMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:header_match_specifier, 0)
  field(:name, 1, type: :string)
  field(:exact_match, 4, type: :string, oneof: 0)
  field(:regex_match, 5, type: :string, deprecated: true, oneof: 0)
  field(:safe_regex_match, 11, type: Envoy.Type.Matcher.RegexMatcher, oneof: 0)
  field(:range_match, 6, type: Envoy.Type.Int64Range, oneof: 0)
  field(:present_match, 7, type: :bool, oneof: 0)
  field(:prefix_match, 9, type: :string, oneof: 0)
  field(:suffix_match, 10, type: :string, oneof: 0)
  field(:invert_match, 8, type: :bool)
end

defmodule Envoy.Api.V2.Route.QueryParameterMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:query_parameter_match_specifier, 0)
  field(:name, 1, type: :string)
  field(:value, 3, type: :string, deprecated: true)
  field(:regex, 4, type: Google.Protobuf.BoolValue, deprecated: true)
  field(:string_match, 5, type: Envoy.Type.Matcher.StringMatcher, oneof: 0)
  field(:present_match, 6, type: :bool, oneof: 0)
end
