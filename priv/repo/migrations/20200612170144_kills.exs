defmodule Kills.Repo.Migrations.Kills do
  use Ecto.Migration

  def change do
    create table(:kills) do
      add :action, :string
      add :alliance_id, :integer
      add :character_id, :integer
      add :corporation_id, :integer
      add :hash, :string
      add :killID, :integer
      add :ship_type_id, :integer
      add :url, :string

      timestamps
    end
  end
end

# %{
#   "action" => "littlekill",
#   "alliance_id" => 99006343,
#   "character_id" => 2115132354,
#   "corporation_id" => 98606096,
#   "hash" => "bbc02a9401a18efbbfe1d81156d05fe96e9703ed",
#   "killID" => 84906560,
#   "ship_type_id" => 32878,
#   "url" => "https://zkillboard.com/kill/84906560/"
# }
