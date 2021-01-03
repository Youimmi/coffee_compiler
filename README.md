# CoffeeCompiler
[CoffeeScript](https://coffeescript.org) compiler for elixir

[![CI](https://github.com/Youimmi/coffee_compiler/workflows/CI/badge.svg?branch=main&event=push)](https://github.com/Youimmi/coffee_compiler) [![hex.pm version](https://img.shields.io/hexpm/v/coffee_compiler.svg)](https://hex.pm/packages/coffee_compiler)

## Documentation

API documentation is available at [https://hexdocs.pm/coffee_compiler/Coffee.html](https://hexdocs.pm/coffee_compiler/Coffee.html)

## Installation

Add `coffee_compiler` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coffee_compiler, "~> 0.1"}
  ]
end
```

## Usage

```elixir
coffee = "/path/to/file.coffee"
Coffee.compile(coffee)
{:ok, "console.log(\"Application\")"}

Coffee.compile(coffee, [root_path: "/absolute/path/to/import/file"})
{:ok, "var o;o=function(o){return`this is Foo file: ${o}`};console.log(o)"}
```

You should pass an `root_path` parameter if you use `@import` derective to include some code
Use relavtive paths `@import  ./relative/path/to/file` in **.coffee** files

## License

CoffeeCompiler is released under [the MIT License](./LICENSE)
