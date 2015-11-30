case {1,2,3} do
  {4,5,6} -> raise("Won't match anyway")
  {1,x,3} -> IO.puts "Matched with #{x} in the middle"
    _ -> raise("Catch-all")
end

# With the pin (`^`) operator:
x = 1

case 2 do
  ^x -> raise("Won't match, the value is 1")
  x -> IO.puts "matched value of x is #{x}"
  _ -> raise("Catch-all")
end

case 1 do
  x when hd(x) -> raise("Should not match")
  x -> IO.puts "Matched: #{x}"
end

f = fn
  x, y when x > 0 -> x + y
  x, y -> x*y
  # x,y,z -> x+y-z # Cannot mix clauses with different arities within a definition.
end

IO.puts f.(1,2)

cond do
  2 + 2 == 5 -> raise("No way")
  2 * 2 == 5 -> raise("No way")
  1 + 1 == 2 -> IO.puts("Cond looks lispy")
end

otherwise = true
cond do
  2 + 2 == 5 -> raise("No way")
  2 * 2 == 5 -> raise("No way")
  otherwise -> IO.puts("Now we have made Haskell")
end

cond do
  hd [1,2,3] -> IO.puts "Cond relies on truthiness"
end

if true do
  IO.puts("We have normal conditionals")
end

unless false do
  IO.puts "As well as reverse logic to make life more difficult"
end

if nil do
  raise "This will not fail"
else
  IO.puts "else is supported"
end

# `do/end` are convenience for passing a group of expressions to `do:` blocks
IO.puts(
if true do
  a = 1 + 2
  a + 10
end
)

# Here, we are using keyword lists
IO.puts(
if true, do: (
          a = 1+2
          a+10
        )
)

IO.puts if false, do: :this, else: :that

# Parens are required here, `do/end` is bound to the outermost function call.
is_number(if true do
  1+2
end)
