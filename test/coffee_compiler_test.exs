defmodule CoffeeCompilerTest do
  use ExUnit.Case
  doctest CoffeeCompiler

  test "greets the world" do
    assert CoffeeCompiler.hello() == :world
  end
end
