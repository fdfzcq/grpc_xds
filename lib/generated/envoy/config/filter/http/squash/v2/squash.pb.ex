defmodule Envoy.Config.Filter.Http.Squash.V2.Squash do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:cluster, 1, type: :string)
  field(:attachment_template, 2, type: Google.Protobuf.Struct)
  field(:request_timeout, 3, type: Google.Protobuf.Duration)
  field(:attachment_timeout, 4, type: Google.Protobuf.Duration)
  field(:attachment_poll_period, 5, type: Google.Protobuf.Duration)
end
