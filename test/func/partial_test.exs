defmodule Func.PartialTest do
  use ExUnit.Case

  alias Func.Partial

  test "arguments are applied partially" do
    func = fn a, b, c, d, e -> [a, b, c, d, e] end

    partialed = Partial.partial(func, [1, 2])

    first = partialed.([3, 4])
    assert is_function(first)

    second = first.([5])
    assert [1, 2, 3, 4, 5] = second
  end
end
