defmodule Envoy.Config.Core.V3.GrpcService.EnvoyGrpc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster_name, 1, type: :string)
  field(:authority, 2, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:root_certs, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:private_key, 2, type: Envoy.Config.Core.V3.DataSource)
  field(:cert_chain, 3, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:credential_specifier, 0)

  field(:ssl_credentials, 1,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials,
    oneof: 0
  )

  field(:google_default, 2, type: Google.Protobuf.Empty, oneof: 0)

  field(:local_credentials, 3,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:json_key, 1, type: :string)
  field(:token_lifetime_seconds, 2, type: :uint64)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:authorization_token, 1, type: :string)
  field(:authority_selector, 2, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:token_exchange_service_uri, 1, type: :string)
  field(:resource, 2, type: :string)
  field(:audience, 3, type: :string)
  field(:scope, 4, type: :string)
  field(:requested_token_type, 5, type: :string)
  field(:subject_token_path, 6, type: :string)
  field(:subject_token_type, 7, type: :string)
  field(:actor_token_path, 8, type: :string)
  field(:actor_token_type, 9, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:credential_specifier, 0)
  field(:access_token, 1, type: :string, oneof: 0)
  field(:google_compute_engine, 2, type: Google.Protobuf.Empty, oneof: 0)
  field(:google_refresh_token, 3, type: :string, oneof: 0)

  field(:service_account_jwt_access, 4,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials,
    oneof: 0
  )

  field(:google_iam, 5,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials,
    oneof: 0
  )

  field(:from_plugin, 6,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin,
    oneof: 0
  )

  field(:sts_service, 7,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:value_specifier, 0)
  field(:string_value, 1, type: :string, oneof: 0)
  field(:int_value, 2, type: :int64, oneof: 0)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:args, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry,
    map: true
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:target_uri, 1, type: :string)

  field(:channel_credentials, 2,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials
  )

  field(:call_credentials, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials
  )

  field(:stat_prefix, 4, type: :string)
  field(:credentials_factory_name, 5, type: :string)
  field(:config, 6, type: Google.Protobuf.Struct)
  field(:per_stream_buffer_limit_bytes, 7, type: Google.Protobuf.UInt32Value)
  field(:channel_args, 8, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs)
end

defmodule Envoy.Config.Core.V3.GrpcService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:target_specifier, 0)
  field(:envoy_grpc, 1, type: Envoy.Config.Core.V3.GrpcService.EnvoyGrpc, oneof: 0)
  field(:google_grpc, 2, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc, oneof: 0)
  field(:timeout, 3, type: Google.Protobuf.Duration)
  field(:initial_metadata, 5, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
end
