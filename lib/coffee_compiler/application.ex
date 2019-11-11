defmodule CoffeeCompiler.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([Coffee.Context], strategy: :one_for_one)
  end
end
