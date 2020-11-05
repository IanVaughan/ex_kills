defmodule Kills.Kill do
  use Ecto.Schema

  schema "kills" do
    field :action, :string
    field :alliance_id, :integer
    field :character_id, :integer
    field :corporation_id, :integer
    field :hash, :string
    field :killID, :integer
    # field :ship_type_id, :integer
    field :url, :string

    belongs_to :ship_type, Kills.Ship #, foreign_key: :id #, define_field: false, foreign_key: :ship_type_id

    timestamps()
  end
end
