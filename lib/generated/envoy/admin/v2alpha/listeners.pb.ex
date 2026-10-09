defmodule Envoy.Admin.V2alpha.Listeners do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:listener_statuses, 1, repeated: true, type: Envoy.Admin.V2alpha.ListenerStatus)
end

defmodule Envoy.Admin.V2alpha.ListenerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:local_address, 2, type: Envoy.Api.V2.Core.Address)
end
