defmodule Func.CurryTest do
  use ExUnit.Case

  alias Func.Curry

  test "greets the world" do
    func = fn a, b, c -> [a, b, c] end

    curried = Curry.curry(func)

    first = curried.(1)
    assert is_function(first)

    second = first.(2)
    assert is_function(second)

    result = second.(3)
    assert [1, 2, 3] = result
  end
end
