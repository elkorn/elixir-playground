# import Print # Does not work, something is missing.
# Have to run `elixirc print.ex` for the printing to work.

# defmodule Print do
#   def print([]) do
#   end

#   def print([result|tail]) do
#     IO.puts result
#     print tail
#   end
# end

# A string is a UTF-8 encoded binary.
string = "hełło"

statements = [
  byte_size(string),
  String.length(string)
]

Print.print statements
