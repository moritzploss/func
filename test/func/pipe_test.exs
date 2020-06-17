defmodule Func.PipeTest do
  use ExUnit.Case

  alias Func.Pipe

  test "pipe arguments through anonymous functions" do
    append_a = fn string -> string <> "a" end
    append_b = fn string -> string <> "b" end

    pipe = Pipe.pipe([append_a, append_b])

    assert "ab" = pipe.("")
  end

  test "handle empty list of functions" do
    pipe = Pipe.pipe([])
    assert "" = pipe.("")
  end

end
