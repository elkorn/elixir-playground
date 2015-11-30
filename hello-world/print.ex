defmodule Print do
  def print([]) do
  end

  def print([result|tail]) do
    IO.puts result
    print tail
  end
end
