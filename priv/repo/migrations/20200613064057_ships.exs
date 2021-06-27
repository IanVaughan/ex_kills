defmodule Kills.Repo.Migrations.Ships do
  use Ecto.Migration

  def change do
    create table(:ships) do
      add :name, :string
      add :class_id, :integer

      timestamps()
    end
  end
end
