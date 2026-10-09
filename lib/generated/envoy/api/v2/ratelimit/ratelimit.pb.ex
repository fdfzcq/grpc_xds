defmodule Envoy.Api.V2.Ratelimit.RateLimitDescriptor.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Api.V2.Ratelimit.RateLimitDescriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  field(:entries, 1, repeated: true, type: Envoy.Api.V2.Ratelimit.RateLimitDescriptor.Entry)
end
