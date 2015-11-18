IO.puts "Hello world from Elixir!"
IO.puts 1        # integer
IO.puts 0x1      # integer
IO.puts 1.0      # float
IO.puts true     # boolean
IO.puts :atom    # atom / symbol
IO.puts "elixir" # string
IO.puts [1,2,3]  # list
# IO.puts {1,2,3}  # tuple
IO.puts 10/2
IO.puts div(10,2)
IO.puts div 10,2
IO.puts rem(7,3)
IO.puts 0x1F      # integer
IO.puts round 10.6
IO.puts trunc 10.6
IO.puts is_boolean(1)
IO.puts is_boolean(true)
IO.puts :hello == :world
IO.puts :hello == :hello
# booleans are atoms
IO.puts is_boolean(:true)
IO.puts is_boolean(:false)
IO.puts "hello #{:world}" # string interpolation is supported
IO.puts is_binary("hello")
IO.puts byte_size("hello")
IO.puts String.upcase "hello"
add = fn a,b -> a+b end
IO.puts is_function(add)
# arity checking
IO.puts is_function(add, 2)
IO.puts is_function(add, 1)
IO.puts [1,2,3] ++ [2]
IO.puts [1,2,3] -- [2]
IO.puts hd [1,2,3]
IO.puts tl [1,2,3]
# tuples
# IO.puts {:ok, "hello"}
IO.puts tuple_size {:ok, "hello"}
tuple = {:ok, "hello"}
IO.puts elem tuple, 1
# Immutable by default
IO.puts elem(put_elem(tuple, 1, "world") , 1)
IO.puts elem tuple, 1
# Lists are stored in memory as linked lists - `length` is a O(N) operation.
IO.puts [1|[2|[3|[4]]]]
list = [1,2,3]
IO.puts [0 | list]
# Tuples are stored contiguously in memory.
# Tuple modification is thus expensive, requiring changing the representation of the whole tuple in memory.
# Convention: if a function is called `size`, it works in constant time. If it's called `length`, it works in linear time.

# Boolean ops
IO.puts true and true
IO.puts true or false
# Boolean ops are short-circuiting
IO.puts true or raise('Le error')
IO.puts false and raise('Le error')
# Operations relying on truthiness/falsiness (lenient on arg types)
IO.puts 1 || true
IO.puts 1 && true
IO.puts nil && 13
IO.puts !1
IO.puts !true
# comparison operators
IO.puts 1 == 1.0
IO.puts 1 === 1.0

# Different data types can be compared. This is for sorting purposes. The general sorting order is: number < atom < reference < functions < port < pid < tuple < maps < list < bitstring
IO.puts 1 < :atom
