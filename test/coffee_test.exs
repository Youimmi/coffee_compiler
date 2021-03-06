defmodule CoffeeTest do
  @moduledoc false

  use ExUnit.Case, async: true
  import ExUnit.Assertions, only: [assert: 1]

  import Support.TestHelpers,
    only: [
      compile: 2,
      fixture_js: 1,
      perform_async: 2
    ]

  ExUnit.Case.register_describe_attribute(__MODULE__, :describe_fixtures)

  @fixtures_path File.cwd!() <> "/test/fixtures/"
  @options assets_path: @fixtures_path

  perform_async([js: "JS", coffee: "CoffeeScript"], fn {ext, ext_name} ->
    source_file_path = @fixtures_path <> "source.#{ext}"
    blank_file_path = @fixtures_path <> "blank.#{ext}"
    expected_js = fixture_js(@fixtures_path <> "compiled.js")

    describe "Compile the #{ext_name} file into JS" do
      test "Coffee.compile/2 compiles #{ext_name} into JS" do
        result = unquote(compile(source_file_path, @options))
        assert(result == unquote(expected_js))
      end

      test "Coffee.compile/2 returns \"\n\" if a blank #{ext_name} file is passed" do
        result = unquote(compile(blank_file_path, @options))
        assert(result == "\n")
      end
    end
  end)

  describe "Compile imported files" do
    result = compile(@fixtures_path <> "app.coffee", @options)

    assert result ==
             "console.log(\"text\");console.log(function(a){return`this is Foo file: ${a}`});console.log(2);console.log(\"Application\")\n"
  end
end
