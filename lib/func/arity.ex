defmodule Func.Arity do

  def arity(func) when is_function(func) do
    {_, arity} = :erlang.fun_info(func, :arity)
    arity
  end

end
