defmodule Math do
  def sum(a,b) do
    do_sum(a,b)
  end

  defp do_sum(a,b) do
    a + b
  end

  def zero?(0), do: true
  def zero?(x) when is_number(x), do: false
end

defmodule Concat do
  # Default arguments
  def join(a,b,sep \\ " ") do
    a <> sep <> b
  end
end

defmodule DefaultTest do
  def dowork (x \\ IO.puts "omg, that is horrible") do
    x
  end
end

IO.puts Math.sum(1, 2)
# IO.puts Math.do_sum(1, 2) # UndefinedFunctionError
IO.puts Math.zero?(0)
(
 fun = &Math.zero?/1
 IO.puts is_function fun
 IO.puts fun.(0)
)

IO.puts Concat.join("Hello", "world")
IO.puts Concat.join("Hello", "world", "_")

# Default value expression will be evaluated on every call.
IO.puts DefaultTest.dowork
IO.puts DefaultTest.dowork 666
IO.puts DefaultTest.dowork "Is it me you're looking for"
IO.puts DefaultTest.dowork
