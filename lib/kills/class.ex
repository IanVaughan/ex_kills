defmodule Kills.Class do
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: false}

  schema "classes" do
    field :name, :string

    timestamps()

    has_many :kills, Kills.Kill, foreign_key: :ship_type_id
  end
end
