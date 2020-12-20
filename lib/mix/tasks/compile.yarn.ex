defmodule Mix.Tasks.Compile.Yarn do
  @moduledoc false

  use Mix.Task

  def run(_args) do
    System.cmd("yarn", ["--silent"], cd: Application.app_dir(:coffee_compiler, "priv"))
    :ok
  end
end
