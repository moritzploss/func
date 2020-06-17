defmodule Func.ConstTest do
  use ExUnit.Case

  alias Func.Const

  test "return argument" do
    assert "test" = Const.const("test").()
  end

end
