defmodule Kills.Kill do
  use Ecto.Schema

  schema "kills" do
    field :action, :string
    field :alliance_id, :integer
    field :character_id, :integer
    field :corporation_id, :integer
    field :hash, :string
    field :killID, :integer
    field :ship_type_id, :integer
    field :url, :string

    timestamps()
  end
end
