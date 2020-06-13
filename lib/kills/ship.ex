defmodule Kills.Ship do
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: false}

  schema "ships" do
    field :name, :string
    field :class_id, :integer

    timestamps()

    has_many :kills, Kills.Kill, foreign_key: :ship_type_id
  end
end
