defmodule Coffee.Compiler do
  @moduledoc """
  Compile coffee source to js
  """

  def compile(_offee, _opts \\ []) do
    {js, _} =
      System.cmd("yarn", ["rollup", "-c", "rollup.config.js"],
        cd: Path.join(:code.priv_dir(:coffee_compiler), ".")
      )

    IO.inspect(js)

    {:ok, js}
  end
end
