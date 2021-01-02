defmodule Mix.Tasks.Yarn.Unplug do
  @moduledoc false

  use Mix.Task

  def run(_args) do
    root_dir = Application.app_dir(:coffee_compiler, "priv")
    System.cmd("yarn", ["unplug", "google-closure-compiler-*", "-R"], cd: root_dir)

    :ok
  end
end
