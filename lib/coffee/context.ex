defmodule Coffee.Context do
  @moduledoc """
  Start coffeescript context
  """

  use Agent

  def start_link(_args) do
    {:ok, source} = File.read(:filename.join(:code.priv_dir(:coffee_compiler), "coffeescript.js"))
    context = Execjs.compile(source)

    Agent.start_link(fn -> context end, name: __MODULE__)
  end
end
