defmodule FuncTest do
  use ExUnit.Case
  doctest Func

  test "greets the world" do
    assert Func.hello() == :world
  end
end
