defmodule Xds.Core.V3.CollectionEntry.InlineEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:name, 1, type: :string)
  field(:version, 2, type: :string)
  field(:resource, 3, type: Google.Protobuf.Any)
end

defmodule Xds.Core.V3.CollectionEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:resource_specifier, 0)
  field(:locator, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0)
  field(:inline_entry, 2, type: Xds.Core.V3.CollectionEntry.InlineEntry, oneof: 0)
end
