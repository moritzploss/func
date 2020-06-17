defmodule Func.ReduceWhileTest do
  use ExUnit.Case

  alias Func.ReduceWhile

  test "behave like regular reduce function if predicate does not evaluate to false" do
    assert 15 = ReduceWhile.reduce_while(
      fn _acc, _val -> true end,
      fn acc, val -> acc + val end,
      0,
      [1, 2, 3, 4, 5])
  end

  test "return initial accumulator if predicate never evaluates to true" do
    assert 0 = ReduceWhile.reduce_while(
      fn _acc, _val -> false end,
      fn acc, val -> acc + val end,
      0,
      [1, 2, 3, 4, 5])
  end

  test "stop when predicate evaluates to false" do
    assert 10 = ReduceWhile.reduce_while(
      fn acc, _val -> acc < 9 end,
      fn acc, val -> acc + val end,
      0,
      [1, 2, 3, 4, 5])
  end

end
