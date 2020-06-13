defmodule ExKills.Read.Ship do

  alias Kills.{Repo, Ship}

  @base_url "https://zkillboard.com/"
  @compent_url "ship/"

  def get(id) do
    case Repo.get(Ship, id) do
      nil -> fetch(id)
      found -> found
    end
  end

  def fetch(id) do
    url = "#{@base_url}#{@compent_url}#{id}/"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, document} = Floki.parse_document(body)
        [ship|class] = Enum.at(Floki.find(document, "td"), 1) |> Floki.find("a")
        {_,[{_, ship_link}],[ship_name]} = ship
        {_,[{_, class_link}],[class_name]} = hd(class)
        # ship_link = ship |> Floki.attribute("href")

        ship_id_text = extract(ship_link)
        class_id_text = extract(class_link)

        {ship_id,_} = Integer.parse(ship_id_text)
        {class_id,_} = Integer.parse(class_id_text)

        IO.inspect ship_name, label: "ship_name"
        IO.inspect ship_id, label: "ship_id"
        IO.inspect class_name, label: "class_name"
        IO.inspect class_id, label: "class_id"

        %Ship{id: ship_id, name: ship_name}
        |> Repo.insert(on_conflict: :nothing)

    {:ok, %HTTPoison.Response{status_code: 404}} ->
      IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
      IO.inspect reason
    end
  end

  def extract(link) do
    [_,_,number,_] = Regex.split(~r|/|, link)
    number
  end
end

# [
#   {"a", [{"href", "/item/626/"}], ["Vexor"]},
#   {"a", [{"href", "/group/26/"}], ["Cruiser"]}
# ]

# Kills.Repo.preload(ship, :kills)
# Kills.Kill |> Ecto.Query.first |> Kills.Repo.one

# kill = Kills.Repo.get(Kills.Kill, 4839)
# Kills.Repo.preload(kill, :ship_type)