defmodule ExKills.Application do
  # See https://hexdocs.pm/elixir/Application.html

  use Application

  def start(_type, _args) do
    children = [
      Kills.Repo,
      # ExKills.Kills # ExKills.Kills.start_link([])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    opts = [strategy: :one_for_one, name: ExKills.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
