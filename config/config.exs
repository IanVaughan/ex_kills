# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_kills,
  ecto_repos: [Kills.Repo]

# Configures the endpoint
config :ex_kills, ExKillsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F0Diz9E7eRj6iQce6kecFpDI7T86J15+uBIUJp8Ivsutssh7w1z2kzQed3b+fd/A",
  render_errors: [view: ExKillsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExKills.PubSub,
  live_view: [signing_salt: "L4k74xxO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
