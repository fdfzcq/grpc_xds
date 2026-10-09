defmodule Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder.PrintOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:add_whitespace, 1, type: :bool)
  field(:always_print_primitive_fields, 2, type: :bool)
  field(:always_print_enums_as_ints, 3, type: :bool)
  field(:preserve_proto_field_names, 4, type: :bool)
end

defmodule Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:descriptor_set, 0)
  field(:proto_descriptor, 1, type: :string, oneof: 0)
  field(:proto_descriptor_bin, 4, type: :bytes, oneof: 0)
  field(:services, 2, repeated: true, type: :string)

  field(:print_options, 3,
    type: Envoy.Config.Filter.Http.Transcoder.V2.GrpcJsonTranscoder.PrintOptions
  )

  field(:match_incoming_request_route, 5, type: :bool)
  field(:ignored_query_parameters, 6, repeated: true, type: :string)
  field(:auto_mapping, 7, type: :bool)
  field(:ignore_unknown_query_parameters, 8, type: :bool)
  field(:convert_grpc_status, 9, type: :bool)
end
