defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
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
