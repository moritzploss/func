defmodule Func.ReduceWhile do
  def reduce_while(predicate, reducer, accumulator, enumerable) do
    Enum.reduce_while(enumerable, accumulator, fn val, acc ->
      case predicate.(acc, val) do
        true -> {:cont, reducer.(acc, val)}
        false -> {:halt, acc}
      end
    end)
  end
end
