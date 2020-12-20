defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to javascript source
  """

  def compile(coffee, _opts) do
    config = Application.app_dir(:coffee_compiler, "priv/rollup.config.js")
    {js, _} = System.cmd("yarn", ["run", "rollup", coffee, "-c", config])
    {:ok, js}
  end
end
