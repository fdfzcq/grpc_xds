# GrpcXds

Provider-independent service discovery using the Envoy xDS v3 Aggregated Discovery Service (ADS). Supply a control plane URL and the listener resource name published for your service:

```elixir
GRPC.XDS.ADS.lookup_service_addresses("http://localhost:18000", "my-service")
# => [{"10.0.0.1", 8080}, {"10.0.0.2", 8080}]
```

No cloud account, project ID, or provider-specific metadata is required. A control plane may require its own node identity or authentication settings:

```elixir
GRPC.XDS.ADS.lookup_service_addresses("https://control-plane.example:443", "my-service",
  node_id: "my-client",
  node_cluster: "payments",
  node_metadata: %{"region" => "eu", "capabilities" => ["discovery"]},
  metadata: %{"authorization" => "Bearer " <> token},
  timeout: 5_000
)
```

`node_id` defaults to `"grpc-xds"`, `node_cluster` to `""`, and `node_metadata` to `%{}`. Metadata supports nested JSON-compatible maps and lists. Pass `node: %Envoy.Config.Core.V3.Node{...}` for complete control over node fields. The old `project_id` setting is no longer used; migrate it to `node_id` if your control plane expects the same identifier.

HTTP uses plaintext gRPC. HTTPS uses TLS with CAStore's trusted roots. For a private CA or mutual TLS, pass gRPC connection options:

```elixir
cred = GRPC.Credential.new(ssl: [
  cacertfile: "/path/to/ca.pem",
  certfile: "/path/to/client.pem",
  keyfile: "/path/to/client-key.pem",
  verify: :verify_peer
])

GRPC.XDS.ADS.lookup_service_addresses("https://control-plane.example:8443", "my-service",
  node_id: "my-client",
  connect_options: [cred: cred, connect_timeout: 5_000]
)
```

URLs must identify an HTTP(S) host and optional port, without a path, query, fragment, or embedded credentials. `host:port` remains supported. `timeout` controls the ADS RPC; `connect_options[:connect_timeout]` controls connection establishment. Service lookups return an address list on success or `{:error, reason}` on failure.

For application-wide configuration:

```elixir
config :grpc_xds,
  control_plane_url: "http://localhost:18000",
  options: [node_id: "my-client", node_metadata: %{}]

GRPC.XDS.ADS.lookup_service_addresses("my-service")
```

The previous `control_plane_address` setting and `get_service_resource(url, service, opts \\ [])` entry point remain supported. `get_resources(channel, names, opts \\ [])` accepts an existing channel and leaves channel ownership with the caller.

Each lookup uses one bidirectional ADS stream, tracks versions and nonces per resource type, acknowledges decoded responses, and closes the stream and owned connection when finished. It follows Listener → RouteConfiguration → Cluster → ClusterLoadAssignment, honoring the cluster's EDS service name.

The address helper accepts an API listener with an HTTP connection manager, RDS, a single virtual host/route pointing to a direct cluster, and an EDS cluster. RDS and EDS config sources must point to ADS on the supplied control plane. It returns TCP endpoints from the highest-weight locality, treating an omitted weight as one. Empty endpoint sets return `[]`; unsupported routing, listener, or cluster shapes return an explicit error. Inline routes, static/weighted clusters, health filtering, and priority selection are not supported yet.

For control planes with a different resource graph, fetch named resources directly:

```elixir
GRPC.XDS.ADS.fetch_resources("http://localhost:18000", :cluster, ["payments"])
# => {:ok, %{"payments" => %Envoy.Config.Cluster.V3.Cluster{...}}}
```

Supported fetch types are `:listener`, `:route_configuration`, `:scoped_route_configuration`, `:virtual_host`, `:cluster`, and `:cluster_load_assignment`. Fetch returns decoded messages without applying routing or endpoint-selection rules. Missing LDS/CDS resources return an error; absent RDS/EDS resources can remain pending until the RPC timeout.

This is a one-shot discovery client, not a full Envoy proxy or gRPC xDS load balancer. It supports v3 state-of-the-world ADS, not Delta xDS, REST, separate discovery-service endpoints, DNS clusters, automatic reconnects, or continuous watches. Control planes must expose that protocol and publish compatible resources; a URL alone cannot provide identity or credentials required by a particular server. See the [xDS protocol specification](https://www.envoyproxy.io/docs/envoy/latest/api-docs/xds_protocol).

Requires Elixir 1.15 or newer. The gRPC client tracks upstream `master`; `mix.lock` records the exact revision. Run `mix deps.get` and `mix test` to verify locally. Tests use a local ADS control plane, including TLS, authentication metadata, protocol acknowledgements, CDS/EDS indirection, and failure handling.

The checked-in Envoy messages use Protobuf's generated structs and types. Shared Google messages come from `protobuf` and `googleapis`; do not regenerate duplicate copies of those modules. Certificates and keys in `test/fixtures` are public test-only fixtures for `localhost`.
