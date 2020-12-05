defmodule Coffee.Compiler do
  @moduledoc """
  Compiles CoffeeScript source into JS source
  """

  @doc """
  Compiles a CoffeeScript into JS
  """
  def compile(coffee, _opts) do
    args = [
      "workspace",
      "coffee_compiler",
      "rollup",
      coffee,
      "-c",
      Application.app_dir(:coffee_compiler, "priv/rollup.config.js")
    ]

    {js, _} = System.cmd("yarn", args, cd: "assets")
    {:ok, js}
  end
end
