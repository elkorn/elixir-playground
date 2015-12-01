defmodule Print do
  def print([]) do
  end

  def print([result|tail]) do
    IO.inspect result
    print tail
  end
end
