defmodule CoffeeCompiler.MixProject do
  use Mix.Project

  @version "0.1.3"

  @description """
  CoffeeScript core compiler for Elixir
  """

  def project do
    [
      app: :coffee_compiler,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: @description,
      package: package(),
      deps: deps(),
      aliases: aliases(),
      source_url: "https://github.com/Youimmi/coffee_compiler"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "LICENSE", "mix.exs", "package.json", "priv/rollup.config.js", "README.md"],
      maintainers: [],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Youimmi/coffee_compiler"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      update: [
        "cmd rm -rf _build .elixir_ls .pnp.js .yarn .yarnrc.yml deps erl_crash.dump mix.lock yarn.lock",
        "deps.get",
        "cmd yarn set version berry && yarn set version latest && yarn"
      ]
    ]
  end
end
