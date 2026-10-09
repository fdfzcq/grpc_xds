defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SYNCHRONOUS, 0)
  field(:ASYNCHRONOUS, 1)
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:arn, 1, type: :string)
  field(:payload_passthrough, 2, type: :bool)

  field(:invocation_mode, 3,
    type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode,
    enum: true
  )
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:invoke_config, 1, type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config)
end
