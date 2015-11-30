odd? = &(rem(&1, 2) != 0)
statements = [
  Enum.map([1,2,3], &(&1 * 2)),
  Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end),
  Enum.reduce(%{1 => 2, 3 => 4}, 1, fn ({k, v}, r) -> k * v * r end),
  Enum.reduce(1..3, 0, &+/2),
  1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum,
  Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 * 3)), odd?)),
  1..100_000 |> Stream.map(&(&1 * 3))
]

Print.print statements
