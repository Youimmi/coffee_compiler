defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
  """

  def compile(coffee, _opts) do
    # assets_path =
    #   opts
    #   |> Map.new()
    #   |> Map.get(:assets_path, "assets")

    root_dir = Application.app_dir(:coffee_compiler)
    config_dir = root_dir <> "/priv/rollup.config.js"

    {js, _} = System.cmd("yarn", ["run", "rollup", coffee, "-c", config_dir], cd: root_dir)
    {:ok, js}
  end
end
