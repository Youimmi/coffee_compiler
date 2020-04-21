defmodule Coffee do
  @moduledoc """
  Compiles Coffee into JS using a CoffeeScript core compiler
  """

  def compile(source, opts \\ []) do
    opts = Map.new(opts)
    coffee = source |> String.trim()
    Coffee.Compiler.compile(coffee, opts)
  end
end
