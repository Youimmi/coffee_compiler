defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to js
  """

  def compile(coffee, _opts) do
    {js, _} =
      System.cmd(
        "yarn",
        [
          "workspace",
          "coffee_compiler",
          "rollup",
          coffee,
          "-c",
          Application.app_dir(:coffee_compiler, "priv/rollup.config.js")
        ],
        cd: "assets"
      )

    {:ok, js}
  end
end
