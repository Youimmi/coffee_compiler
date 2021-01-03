defmodule Coffee.Compiler do
  @moduledoc """
  Compiles CoffeeScript source into JS source
  """

  @assets_path Application.get_env(:coffee_compiler, :assets_path)
  @priv_dir Application.app_dir(:coffee_compiler, "priv")
  @config @priv_dir <> "/rollup.config.js"

  @doc """
  Compiles a CoffeeScript into JS
  """
  def compile(coffee, _opts \\ []) do
    args = ["run", "rollup", coffee, "-c", @config, "--configRootDir=#{@assets_path}"]
    {js, _} = System.cmd("yarn", args, cd: @priv_dir)
    {:ok, js}
  end
end
