defmodule ExKills.Application do
  use Application

  def start(_type, _args) do
    children = [
      Kills.Repo,
      ExKills.Kills # ExKills.Kills.start_link([])
    ]

    opts = [strategy: :one_for_one, name: ExKills.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
