defmodule Udpa.Annotations.PackageVersionStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UNKNOWN, 0)
  field(:FROZEN, 1)
  field(:ACTIVE, 2)
  field(:NEXT_MAJOR_VERSION_CANDIDATE, 3)
end

defmodule Udpa.Annotations.StatusAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:work_in_progress, 1, type: :bool)
  field(:package_version_status, 2, type: Udpa.Annotations.PackageVersionStatus, enum: true)
end
