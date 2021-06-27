defmodule ExKills.Read.Ship do
  alias Kills.{Repo, Ship, Class}

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
        [ship | class] = Enum.at(Floki.find(document, "td"), 1) |> Floki.find("a")
        {_, [{_, ship_link}], [ship_name]} = ship
        {_, [{_, class_link}], [class_name]} = class |> List.last()

        ship_id_text = extract(ship_link)
        class_id_text = extract(class_link)

        {ship_id, _} = Integer.parse(ship_id_text)
        {class_id, _} = Integer.parse(class_id_text)

        %Ship{id: ship_id, name: ship_name, class_id: class_id}
        |> Repo.insert(on_conflict: :nothing)

        %Class{id: class_id, name: class_name}
        |> Repo.insert(on_conflict: :nothing)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def extract(link) do
    [_, _, number, _] = Regex.split(~r|/|, link)
    number
  end
end
