# Keyword list example
(
 list = [{:a, 1}, {:b, 2}]
IO.puts list === [a: 1, b: 2]
IO.puts list[:a]
# Values closest to the front are fetched first for the lookup.
IO.puts [a: 0, a: 1, b: 2][:a]
)
# Keyword lists are used mainly for options, since they are linear for length, index etc.
# Keys must be atoms.
# Ordering depends on the developer.
# Can have multiple instances of the same key.

# Maps
# Ordering is arbitrary.
# Any value can be a key.
(
 map = %{:a => 1, 2 => :b}
IO.puts map[:a]
IO.puts map[2]
IO.puts map[:c]
)
# Variables cannot be used as keys to add items to a map.
# n = :x
# %{n => 1}

# Can be used to access items in a map though.
(
    x = :a
    IO.puts map[x]
)
# Last duplicate key wins.
IO.puts %{1 => 1, 1 => 2}[1]
# Keyword syntax can be used when all the keys are atoms.
IO.puts Map.get(%{a: 13, b: 2}, :a)

# Both lists and maps implement a dictionary behavior (i.e. interface).
(
 keyword = []
 map = %{}

 # IO.puts Dict.get(keyword, :a)
 # IO.puts Dict.get(map, :a)
 IO.puts Dict.put(keyword, :a, 1) == [{:a, 1}]
 IO.puts Dict.put(map, :a, 1) == %{a: 1}
)
