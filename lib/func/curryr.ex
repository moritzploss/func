defmodule Func.Curryr do
  import Func.Arity

  def curryr(func, 0, args) do
    apply(func, args)
  end

  def curryr(func, arity, args) do
    fn arg -> curryr(func, arity - 1, [arg | args]) end
  end

  def curryr(func) when is_function(func) do
    case arity(func) do
      0 -> fn -> func.() end
      n -> curryr(func, n, [])
    end
  end

end
