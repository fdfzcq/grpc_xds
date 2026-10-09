defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:enabled, 1, type: Envoy.Config.Core.V4alpha.RuntimeFeatureFlag)
  field(:min_content_length, 2, type: Google.Protobuf.UInt32Value)
  field(:content_type, 3, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.RequestDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig
  )
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.ResponseDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig
  )

  field(:disable_on_etag_header, 2, type: :bool)
  field(:remove_accept_encoding_header, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:compressor_library, 6, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)

  field(:request_direction_config, 7,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.RequestDirectionConfig
  )

  field(:response_direction_config, 8,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.ResponseDirectionConfig
  )
end
