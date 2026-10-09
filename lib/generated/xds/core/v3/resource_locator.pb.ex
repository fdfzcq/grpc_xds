defmodule Xds.Core.V3.ResourceLocator.Scheme do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:XDSTP, 0)
  field(:HTTP, 1)
  field(:FILE, 2)
end

defmodule Xds.Core.V3.ResourceLocator.Directive do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:directive, 0)
  field(:alt, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0)
  field(:entry, 2, type: :string, oneof: 0)
end

defmodule Xds.Core.V3.ResourceLocator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:context_param_specifier, 0)
  field(:scheme, 1, type: Xds.Core.V3.ResourceLocator.Scheme, enum: true)
  field(:id, 2, type: :string)
  field(:authority, 3, type: :string)
  field(:resource_type, 4, type: :string)
  field(:exact_context, 5, type: Xds.Core.V3.ContextParams, oneof: 0)
  field(:directives, 6, repeated: true, type: Xds.Core.V3.ResourceLocator.Directive)
end
