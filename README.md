# GrpcXds

This is a hack project that uses envoy's xDS gRPC API for service discovery. The implementation has proved to work with GCP's traffic director. Currently there are still many drawbacks in the implementation and this should not be used in prod. To name a few drawbacks:

1. Continuous stream doesn't work for reasons, so for each gRPC call, a new stream is created and closed subsequently.
2. This only serves the purpose of service discovery and gives a list of IPs with highest weight according to the control plane. Extra application logic is needed to choose an address from the list.
3. Only ADS is implemented for the sake of service discovery, but gRPC doesn't really need other xDS endpoints.
4. The GenServer was created for caching but no caches are implemented yet.

To use, call `GRPC.XDS.ADS.get_service_resource(<name>)` where `name` is a string of your service's discovery name.

Requires Elixir 1.15 or newer. The gRPC client tracks upstream `master` using its `grpc` subdirectory; `mix.lock` records the exact revision. Gun supplies the client transport. The gRPC server dependency is used only in tests.

Run `mix deps.get` and `mix test`. The local ADS integration test checks discovery and highest-weight locality selection without external credentials.

Protobuf 0.17 generates message structs and types, so the obsolete explicit declarations have been removed from the checked-in messages. Shared Google messages now come from the `protobuf` and `googleapis` dependencies. The Envoy protobuf fields are unchanged.
