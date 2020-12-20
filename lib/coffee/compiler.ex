defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
  """

  def compile(coffee, opts) do
    assets_path =
      opts
      |> Map.new()
      |> Map.get(:assets_path, "assets")

    config = Application.app_dir(:coffee_compiler, "priv/rollup.config.js")

    {js, _} = System.cmd("yarn", ["run", "rollup", coffee, "-c", config], cd: assets_path)
    {:ok, js}
  end
end
