defmodule Udpa.Annotations.MigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rename, 1, type: :string)
end

defmodule Udpa.Annotations.FieldMigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:rename, 1, type: :string)
  field(:oneof_promotion, 2, type: :string)
end

defmodule Udpa.Annotations.FileMigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:move_to_package, 2, type: :string)
end
