defmodule Numble.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Numble.Worker.start_link(arg)
      {Numble.Server, {Numble.Board.generate_answer(), :augusta}},
      {Numble.Server, {Numble.Board.generate_answer(), :bruce}},
      {Numble.Server, {Numble.Board.generate_answer(), :connor}},
      {Numble.Server, {Numble.Board.generate_answer(), :juno}},
      {Numble.Server, {Numble.Board.generate_answer(), :ross}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Numble.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
