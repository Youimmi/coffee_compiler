defmodule Coffee do
  @moduledoc """
  Compiles CoffeeScript into Javascript using Rollup

  ## Currently supported options

  * assets_path `string` - the path to look for files if @import derectives are used. Default: `"assets"`
  """

  alias Coffee.Compiler

  @doc """
  Compiles a string of CSS/SCSS/Sass into CSS string

  ## Examples

      iex> Coffee.compile("assets/app.coffee")
      {:ok, "console.log(\"Hello!\");\\n"}

      # With options
      iex> Coffee.compile("../javascripts/app.coffee", assets_path: "../javascripts"})
      {:ok, "console.log(\"Hello!\");\\n"}

  """
  def compile(source, opts \\ []) do
    coffee = source |> String.trim()
    Compiler.compile(coffee, opts)
  end
end
