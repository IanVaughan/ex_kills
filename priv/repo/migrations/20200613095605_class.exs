defmodule Kills.Repo.Migrations.Class do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string

      timestamps()
    end
  end
end
