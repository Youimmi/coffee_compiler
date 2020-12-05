defmodule Coffee.Compiler do
  @moduledoc """
  Compiles CoffeeScript source into JS source
  """


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
