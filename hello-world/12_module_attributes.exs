# Reserved attributes:
# `@moduledoc` provides documentation about the module
# `@doc` provides documentation about a function or a macro
# `@behaviour` used for specifying an OTP or user-defined behaviour.
# `@before_compile` provides a hook that will be invoked before compilation.

defmodule ModuleWithAttribute do
  @moduledoc """
  Provides functionalities required for getting to know things related to module
  attributes.

  ## Examples
     iex> ModulewithAttribute.some_attribute
     42
  """
  @some_attribute 42

  @doc """
  This function does something.
  """
  def some_fn() do
    @some_attribute
  end

  @initial_state %{host: "127.0.0.1", port: 1234}

  IO.inspect @initial_state

  @initial_state %{host: "127.0.0.1", port: 5678}
  IO.puts "Redefined initial state #{inspect @initial_state}"
end

defmodule MyPlug do
  use Plug.Builder

  # `plug` is a macro storing the argument in a `@plugs` attribute.
  # Before the module is compiled, Plug runs a callback defining a function
  # `call/2` that handles http requests by running all the plugs in order.
  plug :set_header
  plug :send_ok

  def set_header(conn, _opts) do
    put_resp_header(conn, "x-header", "set")
  end

  def send_ok(conn, _opts) do
    send(conn, 200, "ok")
  end
end

IO.puts "REunning MyPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http MyPlug, []
