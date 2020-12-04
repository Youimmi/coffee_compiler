defmodule Support.TestHelpers do
  @moduledoc false

  def perform_async(enumerable, function),
    do: Stream.each(enumerable, &function.(&1)) |> Stream.run()

  def fixture_js(path), do: File.read!(path)

  def compile("", options),
    do: with({:error, error} <- Coffee.compile("", options), do: error)

  def compile(path, options),
    do: with({:ok, js} <- Coffee.compile(path, options), do: js)
end
