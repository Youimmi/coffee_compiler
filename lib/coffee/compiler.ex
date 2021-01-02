defmodule Coffee.Compiler do
  @moduledoc """
  Compiles CoffeeScript source into JS source
  """

  @doc """
  Compiles a CoffeeScript into JS
  """
  def compile(coffee, _opts) do
    root_dir = Application.app_dir(:coffee_compiler, "priv")
    config_dir = root_dir <> "/rollup.config.js"

    {js, _} = System.cmd("yarn", ["run", "rollup", coffee, "-c", config_dir], cd: root_dir)
    {:ok, js}
  end
end
