# use Mix.Config

import Config

config :ex_kills, ecto_repos: [Kills.Repo]

import_config "#{Mix.env}.exs"
