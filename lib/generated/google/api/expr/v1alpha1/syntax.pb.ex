defmodule Google.Api.Expr.V1alpha1.ParsedExpr do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          expr: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          source_info: Google.Api.Expr.V1alpha1.SourceInfo.t() | nil
        }
  defstruct [:expr, :source_info]

  field(:expr, 2, type: Google.Api.Expr.V1alpha1.Expr)
  field(:source_info, 3, type: Google.Api.Expr.V1alpha1.SourceInfo)
end

defmodule Google.Api.Expr.V1alpha1.Expr.Ident do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field(:name, 1, type: :string)
end

defmodule Google.Api.Expr.V1alpha1.Expr.Select do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          operand: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          field: String.t(),
          test_only: boolean
        }
  defstruct [:operand, :field, :test_only]

  field(:operand, 1, type: Google.Api.Expr.V1alpha1.Expr)
  field(:field, 2, type: :string)
  field(:test_only, 3, type: :bool)
end

defmodule Google.Api.Expr.V1alpha1.Expr.Call do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          target: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          function: String.t(),
          args: [Google.Api.Expr.V1alpha1.Expr.t()]
        }
  defstruct [:target, :function, :args]

  field(:target, 1, type: Google.Api.Expr.V1alpha1.Expr)
  field(:function, 2, type: :string)
  field(:args, 3, repeated: true, type: Google.Api.Expr.V1alpha1.Expr)
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          elements: [Google.Api.Expr.V1alpha1.Expr.t()]
        }
  defstruct [:elements]

  field(:elements, 1, repeated: true, type: Google.Api.Expr.V1alpha1.Expr)
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateStruct.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key_kind: {atom, any},
          id: integer,
          value: Google.Api.Expr.V1alpha1.Expr.t() | nil
        }
  defstruct [:key_kind, :id, :value]

  oneof(:key_kind, 0)
  field(:id, 1, type: :int64)
  field(:field_key, 2, type: :string, oneof: 0)
  field(:map_key, 3, type: Google.Api.Expr.V1alpha1.Expr, oneof: 0)
  field(:value, 4, type: Google.Api.Expr.V1alpha1.Expr)
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateStruct do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message_name: String.t(),
          entries: [Google.Api.Expr.V1alpha1.Expr.CreateStruct.Entry.t()]
        }
  defstruct [:message_name, :entries]

  field(:message_name, 1, type: :string)
  field(:entries, 2, repeated: true, type: Google.Api.Expr.V1alpha1.Expr.CreateStruct.Entry)
end

defmodule Google.Api.Expr.V1alpha1.Expr.Comprehension do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          iter_var: String.t(),
          iter_range: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          accu_var: String.t(),
          accu_init: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          loop_condition: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          loop_step: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          result: Google.Api.Expr.V1alpha1.Expr.t() | nil
        }
  defstruct [:iter_var, :iter_range, :accu_var, :accu_init, :loop_condition, :loop_step, :result]

  field(:iter_var, 1, type: :string)
  field(:iter_range, 2, type: Google.Api.Expr.V1alpha1.Expr)
  field(:accu_var, 3, type: :string)
  field(:accu_init, 4, type: Google.Api.Expr.V1alpha1.Expr)
  field(:loop_condition, 5, type: Google.Api.Expr.V1alpha1.Expr)
  field(:loop_step, 6, type: Google.Api.Expr.V1alpha1.Expr)
  field(:result, 7, type: Google.Api.Expr.V1alpha1.Expr)
end

defmodule Google.Api.Expr.V1alpha1.Expr do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          expr_kind: {atom, any},
          id: integer
        }
  defstruct [:expr_kind, :id]

  oneof(:expr_kind, 0)
  field(:id, 2, type: :int64)
  field(:const_expr, 3, type: Google.Api.Expr.V1alpha1.Constant, oneof: 0)
  field(:ident_expr, 4, type: Google.Api.Expr.V1alpha1.Expr.Ident, oneof: 0)
  field(:select_expr, 5, type: Google.Api.Expr.V1alpha1.Expr.Select, oneof: 0)
  field(:call_expr, 6, type: Google.Api.Expr.V1alpha1.Expr.Call, oneof: 0)
  field(:list_expr, 7, type: Google.Api.Expr.V1alpha1.Expr.CreateList, oneof: 0)
  field(:struct_expr, 8, type: Google.Api.Expr.V1alpha1.Expr.CreateStruct, oneof: 0)
  field(:comprehension_expr, 9, type: Google.Api.Expr.V1alpha1.Expr.Comprehension, oneof: 0)
end

defmodule Google.Api.Expr.V1alpha1.Constant do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          constant_kind: {atom, any}
        }
  defstruct [:constant_kind]

  oneof(:constant_kind, 0)
  field(:null_value, 1, type: Google.Protobuf.NullValue, enum: true, oneof: 0)
  field(:bool_value, 2, type: :bool, oneof: 0)
  field(:int64_value, 3, type: :int64, oneof: 0)
  field(:uint64_value, 4, type: :uint64, oneof: 0)
  field(:double_value, 5, type: :double, oneof: 0)
  field(:string_value, 6, type: :string, oneof: 0)
  field(:bytes_value, 7, type: :bytes, oneof: 0)
  field(:duration_value, 8, type: Google.Protobuf.Duration, deprecated: true, oneof: 0)
  field(:timestamp_value, 9, type: Google.Protobuf.Timestamp, deprecated: true, oneof: 0)
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo.PositionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: integer,
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :int64)
  field(:value, 2, type: :int32)
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo.MacroCallsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: integer,
          value: Google.Api.Expr.V1alpha1.Expr.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :int64)
  field(:value, 2, type: Google.Api.Expr.V1alpha1.Expr)
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          syntax_version: String.t(),
          location: String.t(),
          line_offsets: [integer],
          positions: %{integer => integer},
          macro_calls: %{integer => Google.Api.Expr.V1alpha1.Expr.t() | nil}
        }
  defstruct [:syntax_version, :location, :line_offsets, :positions, :macro_calls]

  field(:syntax_version, 1, type: :string)
  field(:location, 2, type: :string)
  field(:line_offsets, 3, repeated: true, type: :int32)

  field(:positions, 4,
    repeated: true,
    type: Google.Api.Expr.V1alpha1.SourceInfo.PositionsEntry,
    map: true
  )

  field(:macro_calls, 5,
    repeated: true,
    type: Google.Api.Expr.V1alpha1.SourceInfo.MacroCallsEntry,
    map: true
  )
end

defmodule Google.Api.Expr.V1alpha1.SourcePosition do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          location: String.t(),
          offset: integer,
          line: integer,
          column: integer
        }
  defstruct [:location, :offset, :line, :column]

  field(:location, 1, type: :string)
  field(:offset, 2, type: :int32)
  field(:line, 3, type: :int32)
  field(:column, 4, type: :int32)
end
