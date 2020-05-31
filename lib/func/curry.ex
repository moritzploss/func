defmodule Func.Curry do
  import Func.Arity

  def curry(func, 0, args) do
    apply(func, Enum.reverse(args))
  end

  def curry(func, arity, args) do
    fn arg -> curry(func, arity - 1, [arg | args]) end
  end

  def curry(func) when is_function(func) do
    curry(func, arity(func), [])
  end

end
