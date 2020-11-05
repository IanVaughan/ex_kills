defmodule Kills.Corporation do
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: false}

  schema "corporations" do
    field :ceo_id, :integer
    field :creator_id, :integer  # => 1,
    field :description, :string  # => "Caldari Provisions is one of the companies that were created by war veterans of the Gallente-Caldari War. Specializing in the distribution of supply and logistics, Caldari Provisions have carved themselves a nice little niche within the Caldari State and are looking towards expanding their operation in other empires.",
    field :home_station_id, :integer  # => 60000856,
    field :member_count, :integer  # => 271379,
    field :name, :string  # => "Caldari Provisions",
    field :shares, :decimal  # => 2750495824,
    field :tax_rate, :float  # => 0.11,
    field :ticker, :string  # => "CP"

    timestamps()
  end
end
