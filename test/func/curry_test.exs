defmodule Func.CurryTest do
  use ExUnit.Case

  alias Func.Curry

  def join, do: ""
  def join(a), do: a
  def join(a, b), do: a <> join(b)
  def join(a, b, c), do: a <> join(b, c)

  test "curries function with arity 0" do
    curried = Curry.curry(&join/0)
    assert "" = curried.()
  end

  test "curries function with 1 argument" do
    curried = Curry.curry(&join/1)

    result = curried.("a")
    assert "a" = result
  end

  test "curries function with 2 arguments" do
    curried = Curry.curry(&join/2)

    first = curried.("a")
    assert is_function(first)

    result = first.("b")
    assert "ab" = result
  end

  test "curries function with 3 arguments" do
    curried = Curry.curry(&join/3)

    first = curried.("a")
    assert is_function(first)

    second = first.("b")
    assert is_function(second)

    result = second.("c")
    assert "abc" = result
  end
end
