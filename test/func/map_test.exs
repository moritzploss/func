defmodule Func.MapTest do
  use ExUnit.Case

  import Func.Map

  def join, do: ""
  def join(a), do: a
  def join(a, b), do: a <> join(b)
  def join(a, b, c), do: a <> join(b, c)

  def func(arg), do: "mapped " <> arg

  test "maps a function over a list" do
    mapped = map(fn x -> x + 1 end, [1, 2, 3])
    assert [2, 3, 4] = mapped
  end

  test "maps a function with arity 0" do
    mapped = map(&func/1, &join/0)
    assert "mapped " = mapped.()
  end

  test "maps a function with arity 1" do
    mapped = map(&func/1, &join/1)
    assert "mapped a" = mapped.("a")
  end

  test "maps a function with arity 2" do
    mapped = map(&func/1, &join/2)
    assert "mapped ab" = mapped.("a").("b")
  end

  test "map can be curried" do
    mapped = map(&func/1).(&join/0)
    assert "mapped " = mapped.()
  end
end
