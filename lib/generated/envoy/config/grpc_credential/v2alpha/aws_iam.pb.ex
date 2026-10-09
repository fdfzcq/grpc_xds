defmodule Envoy.Config.GrpcCredential.V2alpha.AwsIamConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:service_name, 1, type: :string)
  field(:region, 2, type: :string)
end
