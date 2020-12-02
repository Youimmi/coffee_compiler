defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
  """

  def compile(coffee, opts) do
    opts = Map.new(opts)

    args = [
      "workspace",
      "coffee_compiler",
      "rollup",
      coffee,
      "-c",
      Application.app_dir(:coffee_compiler, "priv/rollup.config.js")
    ]

    assets_path = Map.get(opts, :assets_path) || "assets"
    {js, _} = System.cmd("yarn", args, cd: assets_path)

    {:ok, js}
  end
end
