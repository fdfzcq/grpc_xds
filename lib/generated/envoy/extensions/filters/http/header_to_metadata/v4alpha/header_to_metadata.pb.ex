defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.ValueType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:STRING, 0)
  field(:NUMBER, 1)
  field(:PROTOBUF_VALUE, 2)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.ValueEncode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:NONE, 0)
  field(:BASE64, 1)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.KeyValuePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:value_type, 0)
  field(:metadata_namespace, 1, type: :string)
  field(:key, 2, type: :string)
  field(:value, 3, type: :string, oneof: 0)

  field(:regex_value_rewrite, 6,
    type: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute,
    oneof: 0
  )

  field(:type, 4,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.ValueType,
    enum: true
  )

  field(:encode, 5,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.ValueEncode,
    enum: true
  )
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.Rule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:header_cookie_specifier, 0)
  field(:header, 1, type: :string, oneof: 0)
  field(:cookie, 5, type: :string, oneof: 0)

  field(:on_present, 2,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.KeyValuePair
  )

  field(:on_missing, 3,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.KeyValuePair
  )

  field(:remove, 4, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.Rule
  )

  field(:response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V4alpha.Config.Rule
  )
end
