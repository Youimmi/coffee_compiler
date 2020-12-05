defmodule Coffee.Compiler do
  @moduledoc """
  Compiles CoffeeScript source into JS source
  """

  @doc """
  Compiles a CoffeeScript into JS
  """
  def compile(coffee, opts) do
    assets_path =
      opts
      |> Map.new()
      |> Map.get(:assets_path, "assets")

    args = [
      "workspace",
      "coffee_compiler",
      "rollup",
      coffee,
      "-c",
      Application.app_dir(:coffee_compiler, "priv/rollup.config.js")
    ]

    {js, _} = System.cmd("yarn", args, cd: assets_path)
    {:ok, js}
  end
end
