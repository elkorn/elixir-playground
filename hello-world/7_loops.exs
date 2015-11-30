defmodule Recursion do
  # Basic recursion
  def sum_list([], accumulator) do
    accumulator
  end

  def sum_list([head|tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def double_each([]) do
    []
  end

  def double_each([head|tail]) do
    [head*2|double_each(tail)]
  end

  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
    print_multiple_times(msg, 1)
    print_multiple_times(msg, n-1)
  end
end

IO.puts Recursion.sum_list([1,2,3], 0)
Recursion.print_multiple_times("Yes", 4)
IO.puts Enum.reduce([1,2,3], 0, fn(x, acc) -> x + acc end)
IO.puts Enum.reduce([1,2,3], 0, &+/2)
IO.puts Enum.reduce([1,2,3], 0, &(&1 * 2))
