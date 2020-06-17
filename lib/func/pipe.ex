defmodule Func.Pipe do

  def pipe(funcs) when is_list(funcs) do
    fn arg ->
      Enum.reduce(funcs, arg, fn func, acc -> func.(acc) end)
    end
  end
end
