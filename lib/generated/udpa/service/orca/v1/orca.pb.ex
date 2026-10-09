defmodule Udpa.Service.Orca.V1.OrcaLoadReportRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:report_interval, 1, type: Google.Protobuf.Duration)
  field(:request_cost_names, 2, repeated: true, type: :string)
end
