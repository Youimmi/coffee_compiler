defmodule Coffee do
  @moduledoc """
  Compiles Coffee into JS using a CoffeeScript core compiler
  """

  def compile(source) do
    coffee = source |> String.trim()
    Coffee.Compiler.compile(coffee)
  end
end
