defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:log_name, 2, type: :string)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V2.TCPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:log_entries, 0)
  field(:identifier, 1, type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier)

  field(:http_logs, 2,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries,
    oneof: 0
  )

  field(:tcp_logs, 3,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries,
    oneof: 0
  )
end
