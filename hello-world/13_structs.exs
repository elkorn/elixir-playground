# Structs are extensions built on top of maps.
# They provide compile-time checks and default values.

import User

john = %User{}
meg = %{john | name: "Meg"} # Keeps map unmutated, allows VM to do structural sharing.
kurt = Map.put(%User{}, :name, "Kurt")

statements = [
  %User{},
  %User{name: "Meg"},
  john,
  meg,
  # Structs are bare maps underneath == they do not implement Enum and Dict protocols.
  # john[:name], # protocol Access not implemented
  # Enum.each john, fn({field, value} -> IO.puts(value) end), # protocol Enumerable not implemented
  # Dict.get(john, :name), # undefined function: User.fetch/2
  # Structs work with Map functions though.
  Map.merge(kurt, %User{name: "Takashi"}),
  Map.keys(john),
]

# IO.inspect %User{second_name: "Meg"} # Error: unspecified key for struct User.




Print.print statements

