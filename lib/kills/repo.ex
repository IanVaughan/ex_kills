defmodule Kills.Repo do
  use Ecto.Repo,
    otp_app: :ex_kills,
    adapter: Ecto.Adapters.Postgres
end
