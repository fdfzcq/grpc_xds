defmodule Opencensus.Proto.Trace.V1.Span.SpanKind do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SPAN_KIND_UNSPECIFIED, 0)
  field(:SERVER, 1)
  field(:CLIENT, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:TYPE_UNSPECIFIED, 0)
  field(:SENT, 1)
  field(:RECEIVED, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.Link.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:TYPE_UNSPECIFIED, 0)
  field(:CHILD_LINKED_SPAN, 1)
  field(:PARENT_LINKED_SPAN, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:entries, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Tracestate.Entry)
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: Opencensus.Proto.Trace.V1.AttributeValue)
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:attribute_map, 1,
    repeated: true,
    type: Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry,
    map: true
  )

  field(:dropped_attributes_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:description, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:attributes, 2, type: Opencensus.Proto.Trace.V1.Span.Attributes)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:type, 1, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type, enum: true)
  field(:id, 2, type: :uint64)
  field(:uncompressed_size, 3, type: :uint64)
  field(:compressed_size, 4, type: :uint64)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:value, 0)
  field(:time, 1, type: Google.Protobuf.Timestamp)
  field(:annotation, 2, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation, oneof: 0)
  field(:message_event, 3, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent, oneof: 0)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvents do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:time_event, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.TimeEvent)
  field(:dropped_annotations_count, 2, type: :int32)
  field(:dropped_message_events_count, 3, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span.Link do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trace_id, 1, type: :bytes)
  field(:span_id, 2, type: :bytes)
  field(:type, 3, type: Opencensus.Proto.Trace.V1.Span.Link.Type, enum: true)
  field(:attributes, 4, type: Opencensus.Proto.Trace.V1.Span.Attributes)
  field(:tracestate, 5, type: Opencensus.Proto.Trace.V1.Span.Tracestate)
end

defmodule Opencensus.Proto.Trace.V1.Span.Links do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:link, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Link)
  field(:dropped_links_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:trace_id, 1, type: :bytes)
  field(:span_id, 2, type: :bytes)
  field(:tracestate, 15, type: Opencensus.Proto.Trace.V1.Span.Tracestate)
  field(:parent_span_id, 3, type: :bytes)
  field(:name, 4, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:kind, 14, type: Opencensus.Proto.Trace.V1.Span.SpanKind, enum: true)
  field(:start_time, 5, type: Google.Protobuf.Timestamp)
  field(:end_time, 6, type: Google.Protobuf.Timestamp)
  field(:attributes, 7, type: Opencensus.Proto.Trace.V1.Span.Attributes)
  field(:stack_trace, 8, type: Opencensus.Proto.Trace.V1.StackTrace)
  field(:time_events, 9, type: Opencensus.Proto.Trace.V1.Span.TimeEvents)
  field(:links, 10, type: Opencensus.Proto.Trace.V1.Span.Links)
  field(:status, 11, type: Opencensus.Proto.Trace.V1.Status)
  field(:resource, 16, type: Opencensus.Proto.Resource.V1.Resource)
  field(:same_process_as_parent_span, 12, type: Google.Protobuf.BoolValue)
  field(:child_span_count, 13, type: Google.Protobuf.UInt32Value)
end

defmodule Opencensus.Proto.Trace.V1.Status do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:code, 1, type: :int32)
  field(:message, 2, type: :string)
end

defmodule Opencensus.Proto.Trace.V1.AttributeValue do
  @moduledoc false
  use Protobuf, syntax: :proto3

  oneof(:value, 0)
  field(:string_value, 1, type: Opencensus.Proto.Trace.V1.TruncatableString, oneof: 0)
  field(:int_value, 2, type: :int64, oneof: 0)
  field(:bool_value, 3, type: :bool, oneof: 0)
  field(:double_value, 4, type: :double, oneof: 0)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrame do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:function_name, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:original_function_name, 2, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:file_name, 3, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:line_number, 4, type: :int64)
  field(:column_number, 5, type: :int64)
  field(:load_module, 6, type: Opencensus.Proto.Trace.V1.Module)
  field(:source_version, 7, type: Opencensus.Proto.Trace.V1.TruncatableString)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrames do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:frame, 1, repeated: true, type: Opencensus.Proto.Trace.V1.StackTrace.StackFrame)
  field(:dropped_frames_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:stack_frames, 1, type: Opencensus.Proto.Trace.V1.StackTrace.StackFrames)
  field(:stack_trace_hash_id, 2, type: :uint64)
end

defmodule Opencensus.Proto.Trace.V1.Module do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:module, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:build_id, 2, type: Opencensus.Proto.Trace.V1.TruncatableString)
end

defmodule Opencensus.Proto.Trace.V1.TruncatableString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:value, 1, type: :string)
  field(:truncated_byte_count, 2, type: :int32)
end
