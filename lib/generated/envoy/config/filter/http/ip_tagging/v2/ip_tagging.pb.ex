defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.RequestType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:BOTH, 0)
  field(:INTERNAL, 1)
  field(:EXTERNAL, 2)
end

defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.IPTag do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:ip_tag_name, 1, type: :string)
  field(:ip_list, 2, repeated: true, type: Envoy.Api.V2.Core.CidrRange)
end

defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:request_type, 1,
    type: Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.RequestType,
    enum: true
  )

  field(:ip_tags, 4, repeated: true, type: Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.IPTag)
end
