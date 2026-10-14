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

HTTP uses plaintext gRPC. HTTPS uses TLS with CAStore's trusted roots. Mutual TLS
uses the existing gRPC credential API; no cloud SDK, secret store, or certificate
issuer is required. Supply PEM files from whichever provisioning mechanism your
application uses:

```elixir
control_plane_cred = GRPC.Credential.new(ssl: [
  cacertfile: "/certs/control-plane-ca.pem",
  certfile: "/certs/discovery-client.pem",
  keyfile: "/certs/discovery-client-key.pem",
  verify: :verify_peer,
  customize_hostname_check: [match_fun: :public_key.pkix_verify_hostname_match_fun(:https)]
])

GRPC.XDS.ADS.lookup_service_addresses("https://control-plane.example:8443", "my-service",
  connect_options: [cred: control_plane_cred, connect_timeout: 5_000]
)
```

Both peers must trust the appropriate issuing CA. The control plane must require
client certificates; presenting one to a server that does not validate it does
not establish mutual authentication. Node IDs and ADS metadata do not substitute
for certificate authentication.

### Service connections and server identity

Control-plane credentials secure only ADS. Discovery returns addresses, not a
TLS-configured service channel. Configure service credentials independently:

```elixir
service_cred = GRPC.Credential.new(ssl: [
  cacertfile: "/certs/service-ca.pem",
  certfile: "/certs/service-client.pem",
  keyfile: "/certs/service-client-key.pem",
  verify: :verify_peer,
  server_name_indication: ~c"payments.example",
  customize_hostname_check: [match_fun: :public_key.pkix_verify_hostname_match_fun(:https)]
])

# This address may come from ADS. Verify the configured service DNS identity,
# even though the network connection uses its discovered IP address.
{:ok, channel} = GRPC.Stub.connect("https://192.0.2.10:50051", cred: service_cred)
# Use the generated service stub, then disconnect when the channel is retired.
GRPC.Stub.disconnect(channel)
```

`server_name_indication` is a charlist containing the expected DNS name from the
server certificate's subject alternative names. Choose that identity from trusted
application configuration. Omit the override when the target hostname itself is
the expected certificate identity. URI/SPIFFE identities need a separate verifier;
this example performs DNS identity verification. Server-side authorization of a
particular client identity is also separate from trusting its certificate chain.

### Requiring client certificates on a gRPC server

For applications using `grpc_server`, pass credentials through the server adapter:

```elixir
server_cred = GRPC.Credential.new(ssl: [
  cacertfile: "/certs/client-ca.pem",
  certfile: "/certs/server.pem",
  keyfile: "/certs/server-key.pem",
  verify: :verify_peer,
  fail_if_no_peer_cert: true
])

# Add this child to the application's supervision tree.
{GRPC.Server.Supervisor,
 endpoint: MyApp.Endpoint,
 port: 50051,
 start_server: true,
 adapter_opts: [cred: server_cred]}
```

### Certificate lifecycle and scope

Keep private keys out of source code and provide certificate chains as needed by
your issuer. The application owns provisioning and renewal. Replacing PEM files
alone does not renew established TLS connections, and Erlang/OTP may cache PEM
contents. Automatic file watching, cache invalidation, and channel/listener
rotation are not implemented here; coordinate renewal with your application's
connection lifecycle. ADS lookups open and close their own channel on each call.

These examples use explicit TLS configuration. `grpc_xds` does not interpret xDS
transport-socket TLS policies or implement SDS secret discovery.

URLs must identify an HTTP(S) host and optional port, without a path, query, fragment, or embedded credentials. `host:port` remains supported. `timeout` controls the ADS RPC; `connect_options[:connect_timeout]` controls connection establishment. Service lookups return an address list on success or `{:error, reason}` on failure.

For application-wide configuration:

```elixir
config :grpc_xds,
  control_plane_url: "http://localhost:18000",
  options: [node_id: "my-client", node_metadata: %{}]

GRPC.XDS.ADS.lookup_service_addresses("my-service")
```

The previous `control_plane_address` setting and `get_service_resource(url, service, opts \\ [])` entry point remain supported. `get_resources(channel, names, opts \\ [])` accepts an existing channel and leaves channel ownership with the caller.

Each lookup uses one bidirectional ADS stream, tracks versions and nonces per resource type, acknowledges decoded responses, and closes the stream and owned connection when finished. It follows Listener → RouteConfiguration → Cluster → ClusterLoadAssignment, honoring the cluster's EDS service name. Inline route configurations and static cluster load assignments are also supported.

The address helper accepts an API listener with an HTTP connection manager and a single virtual host/route, referencing a direct cluster or weighted clusters. RDS and EDS config sources must point to ADS on the supplied control plane. It returns healthy (or unspecified-health) TCP endpoints from the lowest available priority and highest-weight localities, treating omitted weights as one. It returns all eligible addresses across nonzero weighted clusters; it does not implement traffic balancing or route matching. Empty endpoint sets return `[]`; unsupported routing, listener, or cluster shapes return an explicit error.

For control planes with a different resource graph, fetch named resources directly:

```elixir
GRPC.XDS.ADS.fetch_resources("http://localhost:18000", :cluster, ["payments"])
# => {:ok, %{"payments" => %Envoy.Config.Cluster.V3.Cluster{...}}}
```

Supported fetch types are `:listener`, `:route_configuration`, `:scoped_route_configuration`, `:virtual_host`, `:cluster`, and `:cluster_load_assignment`. Fetch returns decoded messages without applying routing or endpoint-selection rules. Missing LDS/CDS resources return an error; absent RDS/EDS resources can remain pending until the RPC timeout.

This is a one-shot discovery client, not a full Envoy proxy or gRPC xDS load balancer. It supports v3 state-of-the-world ADS, not Delta xDS, REST, separate discovery-service endpoints, DNS clusters, automatic reconnects, or continuous watches. Control planes must expose that protocol and publish compatible resources; a URL alone cannot provide identity or credentials required by a particular server. See the [xDS protocol specification](https://www.envoyproxy.io/docs/envoy/latest/api-docs/xds_protocol).

Requires Elixir 1.15 or newer. The gRPC client tracks upstream `master`; `mix.lock` records the exact revision. Run `mix deps.get` and `mix test` to verify locally. Tests use a local ADS control plane, including TLS, authentication metadata, protocol acknowledgements, CDS/EDS indirection, and failure handling.

The checked-in Envoy messages use Protobuf's generated structs and types. Shared Google messages come from `protobuf` and `googleapis`; do not regenerate duplicate copies of those modules. Certificates and keys in `test/fixtures` are public test-only fixtures for local
servers. The mTLS suite verifies successful ADS discovery over an IP with a DNS
identity and rejects missing, untrusted, and expired client certificates, an
untrusted server CA, a wrong server identity, and an expired server certificate.
Regenerate its fixtures with `sh test/fixtures/mtls/generate.sh` (OpenSSL required
only for regeneration). CA signing keys are discarded; committed leaf keys are
intentionally public test data. The valid fixtures expire ten years after generation;
expired fixtures use fixed historical dates.
