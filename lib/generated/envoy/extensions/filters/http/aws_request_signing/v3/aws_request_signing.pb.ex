defmodule Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:service_name, 1, type: :string)
  field(:region, 2, type: :string)
  field(:host_rewrite, 3, type: :string)
end
