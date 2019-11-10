defmodule Coffee.Application do
  use Application

  def start(_type, _args) do
    children = [
      Coffee.Context
    ]

    Supervisor.start_link(children, trategy: :one_for_one)
  end
end
