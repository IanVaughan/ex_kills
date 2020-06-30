use Mix.Config

config :ex_kills, Kills.Repo,
  username: "postgres",
  password: "123456",
  database: "ex_kills_repo",
  socket_dir: "/tmp/cloudsql/ex-kills:us-west1:ex-kills-db-us-west1",
  pool_size: 15
