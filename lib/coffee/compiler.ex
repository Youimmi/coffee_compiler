defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to js
  """

  def compile(coffee) do
    context = Agent.get(Coffee.Context, & &1)
    Execjs.call(context, "CoffeeScript.compile", [coffee])
  end
end