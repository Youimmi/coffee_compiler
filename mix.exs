defmodule CoffeeCompiler.MixProject do
  use Mix.Project

  @version "0.1.1"

  @description """
  CoffeeScript core compiler for Elixir
  """

  def project do
    [
      app: :coffee_compiler,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: @description,
      package: package(),
      deps: deps(),
      source_url: "https://github.com/Youimmi/coffee_compiler"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {CoffeeCompiler.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "LICENSE", "mix.exs", "priv/coffeescript.js", "README.md"],
      maintainers: [],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Youimmi/coffee_compiler"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4.0-rc.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:execjs, "~> 2.0"}
    ]
  end
end
