import Config

config :ex_kills, Kills.Repo,
  database: "ex_kills_repo",
  hostname: "localhost"

config :ex_kills, ecto_repos: [Kills.Repo]