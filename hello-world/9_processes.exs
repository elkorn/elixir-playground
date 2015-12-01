defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

statements = [
  spawn(fn -> 1 + 2 end),
  Process.alive?(spawn fn -> 1 + 2 end),
  self(),
  Process.alive?(self),
  (send self(), {:hello, "world"}),
  receive do
    {:hello, msg} -> msg
    {:world, _} -> "won't match"
  end,
  receive do
    {:hello, msg} -> msg
  after
    100 -> "nothing after 100ms"
  end,
  (
    parent = self()
    spawn fn -> send(parent, {:hello, self()}) end
    receive do
      {:hello, pid} -> "Got hello from #{inspect pid}"
    after
      100 -> "nothing after 100ms"
    end
  ),
  # `flush` is only available in the console.
  # ( (send self(), :hello)
  #  flush()
  # )
  # Isolated process, failure is logged but not propagated.
  (spawn fn -> raise "oops" end),
  "Still running!",
  # Link the child process to this one, so that the failure is propagated.
  # (spawn_link fn -> raise "oops" end),
  # "Still running!"
  (
   {:ok, pid} = KV.start_link
   Process.register(pid, :kv)
  ),
  (
   send :kv, {:get, :hello, self()}
   receive do
     val -> "Got #{inspect val} from the KV"
   after
     100 -> "nothing in the KV"
   end
  ),
  (
   send :kv, {:put, :hello, :world}
   send :kv, {:get, :hello, self()}
   receive do
     val -> "Got #{inspect val} from the KV"
   after
     100 -> "nothing in the KV"
   end
  ),
  # Agents are simple abstractions over state.
  (
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
    Agent.get(pid, fn map -> Map.get(map, :hello) end)
  )
]

Print.print statements
