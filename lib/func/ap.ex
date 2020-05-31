defmodule Func.Ap do
  def ap(func, args) when is_function(func) and is_list(args) do
    Enum.reduce(args, func, fn arg, func -> func.(arg) end)
  end
end
