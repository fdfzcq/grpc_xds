defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
  field(:min_content_length, 2, type: Google.Protobuf.UInt32Value)
  field(:content_type, 3, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig
  )
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig
  )

  field(:disable_on_etag_header, 2, type: :bool)
  field(:remove_accept_encoding_header, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:content_length, 1, type: Google.Protobuf.UInt32Value, deprecated: true)
  field(:content_type, 2, repeated: true, type: :string, deprecated: true)
  field(:disable_on_etag_header, 3, type: :bool, deprecated: true)
  field(:remove_accept_encoding_header, 4, type: :bool, deprecated: true)
  field(:runtime_enabled, 5, type: Envoy.Config.Core.V3.RuntimeFeatureFlag, deprecated: true)
  field(:compressor_library, 6, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:request_direction_config, 7,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig
  )

  field(:response_direction_config, 8,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig
  )
end
