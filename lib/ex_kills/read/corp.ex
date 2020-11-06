defmodule ExKills.Read.Corp do

  alias Kills.{Repo, Corporation}

  @base_url "https://esi.evetech.net/latest/" #/?datasource=tranquility
  @compent_url "corporations/"

  def get(id) do
    case Repo.get(Corporation, id) do
      nil -> fetch(id)
      found -> found
    end
  end

  def fetch(id) do
    url = "#{@base_url}#{@compent_url}#{id}/" # |> IO.inspect
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        data = body |> Jason.decode!()

        %Corporation{
          id: id, # 1000009
          ceo_id: data["ceo_id"], # => 3004073,
          creator_id: data["creator_id"], # => 1,
          description: data["description"], # => "Caldari Provisions is one of the companies that were created by war veterans of the Gallente-Caldari War. Specializing in the distribution of supply and logistics, Caldari Provisions have carved themselves a nice little niche within the Caldari State and are looking towards expanding their operation in other empires.",
          home_station_id: data["home_station_id"], # => 60000856,
          member_count: data["member_count"], # => 271379,
          name: data["name"], # => "Caldari Provisions",
          shares: data["shares"], # => 2750495824,
          tax_rate: data["tax_rate"], # => 0.11,
          ticker: data["ticker"], # => "CP"
        }
        |> Repo.insert(on_conflict: :nothing)

    {:ok, %HTTPoison.Response{status_code: 404}} ->
      IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
      IO.inspect reason
    end
  end
end
