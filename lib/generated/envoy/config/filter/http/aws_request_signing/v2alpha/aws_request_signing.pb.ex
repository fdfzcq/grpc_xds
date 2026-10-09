defmodule Envoy.Config.Filter.Http.AwsRequestSigning.V2alpha.AwsRequestSigning do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:service_name, 1, type: :string)
  field(:region, 2, type: :string)
  field(:host_rewrite, 3, type: :string)
end
