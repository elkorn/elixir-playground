require Integer
# import Integer, only: :macros
# import Integer, only: :functions
# `import` is used to provide functions without having to use fully-qualified names.
import List, only: [duplicate: 2]
# A module has to be required if you want to use macros defined within it.
IO.inspect Integer.is_odd(2)
IO.inspect duplicate :ok, 3
