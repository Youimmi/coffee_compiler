defmodule Coffee do
  @moduledoc """
  Compiles Coffee into JS using Rollup
  """

  def compile(source, opts \\ []) do
    coffee = source |> String.trim()
    Coffee.Compiler.compile(coffee, opts)
  end
end
