defmodule Mix.Tasks.Compile.Yarn do
  @moduledoc false

  use Mix.Task

  def run(_args) do
    priv_dir = Application.app_dir(:coffee_compiler, "priv")
    System.cmd("yarn", ["--silent"], cd: priv_dir)
    :ok
  end
end
