defmodule ExKills.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kills.Repo,
      # Start the Telemetry supervisor
      ExKillsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExKills.PubSub},
      # Start the Endpoint (http/https)
      ExKillsWeb.Endpoint
      # Start a worker by calling: ExKills.Worker.start_link(arg)
      # {ExKills.Worker, arg}
      # ExKills.Kills # 
      # ExKills.Kills.start_link([])
    ]

    opts = [strategy: :one_for_one, name: ExKills.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ExKillsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
