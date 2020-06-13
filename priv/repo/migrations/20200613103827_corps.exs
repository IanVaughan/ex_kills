defmodule Kills.Repo.Migrations.Corps do
  use Ecto.Migration

  def change do
    create table(:corporations) do
      add :ceo_id, :integer
      add :creator_id, :integer  # => 1,
      add :description, :text  # => "Caldari Provisions is one of the companies that were created by war veterans of the Gallente-Caldari War. Specializing in the distribution of supply and logistics, Caldari Provisions have carved themselves a nice little niche within the Caldari State and are looking towards expanding their operation in other empires.",
      add :home_station_id, :integer  # => 60000856,
      add :member_count, :integer  # => 271379,
      add :name, :string  # => "Caldari Provisions",
      add :shares, :decimal  # => 2750495824,
      add :tax_rate, :float  # => 0.11,
      add :ticker, :string  # => "CP"

      timestamps()
    end
  end
end
