defmodule Support.TestHelpers do
  @moduledoc false

  def compile("", opts) do
    with({:error, error} <- Coffee.compile("", opts), do: error)
  end

  def compile(path, opts) do
    with({:ok, js} <- Coffee.compile(path, opts), do: js)
  end

  def fixture_js(path), do: File.read!(path)

  def perform_async(enumerable, function) do
    Stream.each(enumerable, &function.(&1)) |> Stream.run()
  end
end
