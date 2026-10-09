defmodule Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:target_names, 2, repeated: true, type: :string)
end

defmodule Envoy.Admin.V3.UnreadyTargetsDumps do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:unready_targets_dumps, 1,
    repeated: true,
    type: Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump
  )
end
