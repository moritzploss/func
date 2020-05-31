defmodule Func.PlaceholderTest do
  use ExUnit.Case

  alias Func.Placeholder

  test "greets the world" do
    refute Placeholder.is_placeholder?("foo")
    refute Placeholder.is_placeholder?(fn foo -> foo end)
    assert Placeholder.is_placeholder?(:__)
  end
end
