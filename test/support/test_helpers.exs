defmodule Support.TestHelpers do
  @moduledoc false

  import ExUnit.Assertions, only: [assert: 1]

  @fixtures_path "test/fixtures/"
  @options assets_path: @fixtures_path

  def fixtures_path, do: @fixtures_path

  def assert(result, expected, function),
    do: assert(function.(expected, result))

  def perform_async(enumerable, function),
    do: Stream.each(enumerable, &function.(&1)) |> Stream.run()

  def fixture_js(path), do: File.read!(path)

  def compile(""),
    do: with({:error, error} <- Coffee.compile("", @options), do: error)

  def compile(path),
    do: with({:ok, js} <- Coffee.compile(path, @options), do: js)
end
