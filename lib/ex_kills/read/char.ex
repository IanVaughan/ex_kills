defmodule ExKills.Read.Char do

  alias Kills.{Repo, Character}

  @base_url "https://esi.evetech.net/latest/" #/?datasource=tranquility
  @compent_url "characters/"

  def get(id) do
    case Repo.get(Character, id) do
      nil -> fetch(id)
      found -> found
    end
  end

  def fetch(id) do
    url = "#{@base_url}#{@compent_url}#{id}/" |> IO.inspect
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        data = body |> Jason.decode!()

        %Character{
          id: id, # 1000009
          alliance_id: data["alliance_id"],
          ancestry_id: data["ancestry_id"],
          birthday: data["birthday"],
          bloodline_id: data["bloodline_id"],
          corporation_id: data["corporation_id"],
          description: data["description"],
          gender: data["gender"],
          name: data["name"],
          race_id: data["race_id"],
          security_status: data["security_status"],
        }
        |> Repo.insert(on_conflict: :nothing)

    {:ok, %HTTPoison.Response{status_code: 404}} ->
      IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
      IO.inspect reason
    end
  end
end











