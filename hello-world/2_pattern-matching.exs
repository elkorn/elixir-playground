x = 1
IO.puts x
IO.puts 1 = x
# IO.puts 2 = x
# destructuring
{a,b,c} = {:hello, "world", 42}
IO.puts a
IO.puts b
IO.puts c
[a, b, c] = [1, 2, 3]
IO.puts a
IO.puts b
IO.puts c
# Omit part of a value in a match
[h | _] = [1, 2, 3]
IO.puts h
