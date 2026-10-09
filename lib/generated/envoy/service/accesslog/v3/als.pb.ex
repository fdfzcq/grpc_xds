defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:log_name, 2, type: :string)
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V3.HTTPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V3.TCPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:log_entries, 0)
  field(:identifier, 1, type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier)

  field(:http_logs, 2,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries,
    oneof: 0
  )

  field(:tcp_logs, 3,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries,
    oneof: 0
  )
end
