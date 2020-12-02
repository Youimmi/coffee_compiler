defmodule CoffeeTest do
  @moduledoc false

  use ExUnit.Case, async: true
  import ExUnit.Callbacks, only: [setup_all: 1]

  import Support.TestHelpers,
    only: [
      assert: 3,
      compile: 1,
      fixture_js: 1,
      fixtures_path: 0,
      perform_async: 2
    ]

  @fixtures_path quote do: unquote(fixtures_path())

  setup_all do
    {:ok, extensions: ~w[js coffee]a}
  end

  test "Coffee.compile/2 compiles JS or Coffee to JS", %{extensions: extensions} do
    sources = Enum.map(extensions, &{&1, @fixtures_path <> "source.#{&1}"})

    perform_async(extensions, fn ext_name ->
      assert(
        compile(sources[ext_name]),
        fixture_js(@fixtures_path <> "compiled.js"),
        &(&2 == &1)
      )
    end)
  end

  test "Coffee.compile/2 compiles JS and Coffee to JS", %{extensions: extensions} do
    sources = Enum.map(extensions, &{&1, @fixtures_path <> "blank.#{&1}"})

    perform_async(extensions, fn ext_name ->
      assert(
        compile(sources[ext_name]),
        "\n",
        &(&2 == &1)
      )
    end)
  end

  test "@import works as expected with load path" do
    perform_async(
      [
        ~r/var o;o=function\(o\)\{return`this is Foo file: \$\{o\}`\}/,
        ~r/console.log\(\"text\"\)/,
        ~r/console.log\(o\)/,
        ~r/console.log\(2\)/,
        ~r/console.log\(\"Application\"\)/
      ],
      fn regexp ->
        assert(
          regexp,
          compile(@fixtures_path <> "app.coffee"),
          &Regex.match?(&2, &1)
        )
      end
    )
  end
end
