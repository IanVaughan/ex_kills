defmodule Kills.Repo.Migrations.Ships do
  use Ecto.Migration

  def change do
    create table(:ships) do # , primary_key: false
      # add :id, :integer, primary_key: true, null: false
      add :name, :string
      add :class_id, :integer

      timestamps()
    end
  end
end
