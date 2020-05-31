defmodule Func.Partial do
  import Func.Arity

  def partial(func, args) when is_function(func) and is_list(args) do
    case arity(func) - length(args) do
      0 -> apply(func, args)
      _ -> fn more_args -> partial(func, args ++ more_args) end
    end
  end

end
