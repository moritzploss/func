defmodule Func.IdentityTest do
  use ExUnit.Case

  alias Func.Identity

  test "return argument" do
    assert "test" = Identity.identity("test")
  end

end
