defmodule Func.Map do
  alias Func.Arity
  alias Func.Curry

  def map_curried(func, curried, arity) do
    case arity do
      0 -> fn -> func.(curried.()) end
      1 -> fn arg -> func.(curried.(arg)) end
      n -> fn arg -> map_curried(func, curried.(arg), n - 1) end
    end
  end

  @spec map((B -> C), (A -> B)) :: (A -> C)
  def map(func, functor) when is_function(func) and is_function(functor) do
    map_curried(func, Curry.curry(functor), Arity.arity(functor))
  end

  @spec map((A -> B), [A]) :: [B]
  def map(func, functor) when is_function(func) do
    Enum.map(functor, func)
  end

  @spec map((A -> B)) :: ([A] -> [B])
  def map(func) when is_function(func) do
    Curry.curry(&map/2).(func)
  end
end
