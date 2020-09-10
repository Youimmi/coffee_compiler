defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
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
