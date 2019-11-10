defmodule Coffee do
  @moduledoc """
  Compiles Coffee into JS using a CoffeeScript core compiler
  """

  def compile(string) do
    coffee = string |> String.trim()
    Coffee.Compiler.compile(coffee)
  end
end
