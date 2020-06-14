use Mix.Config

config :ex_kills, Kills.Repo,
  username: "postgres",
  password: "123456",
  database: "ex_kills_repo",
  socket_dir: "/tmp/cloudsql/ex-kills:europe-west2:ex-kills-db",
  pool_size: 15
