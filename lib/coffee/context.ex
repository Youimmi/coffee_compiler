defmodule Coffee.Context do
  @moduledoc """
  Start coffeescript context
  """

  use Agent

  def start_link(args) do
    IO.puts(args)
    {:ok, source} = File.read(:filename.join(:code.priv_dir(:coffee_compiler), "coffeescript.js"))
    context = Execjs.compile(source)

    Agent.start_link(fn -> context end, name: __MODULE__)
  end
end
