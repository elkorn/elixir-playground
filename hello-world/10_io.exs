IO.puts :stderr, "hello world"
# IO.puts IO.gets "yes or no?"
{:ok, file} = File.open "hello", [:write]
IO.binwrite file, "world"
File.close file
IO.inspect File.read "hello"
IO.inspect Path.join("foo", "bar")
IO.inspect Path.join("foo", "bar")
