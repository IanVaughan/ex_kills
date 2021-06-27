use Mix.Config

config :ex_kills, Kills.Repo,
  username: "postgres",
  password: "y1kBFsfjlOAI4ntB",
  database: "ex_kills_repo",
  socket_dir: "/tmp/cloudsql/ex-kills-project-us-east1:us-central1:ex-kills-db2",
  pool_size: 15
