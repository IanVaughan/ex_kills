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

# -H  "If-None-Match: 4c24d138af462a8fa861ca083cd86e8490d2e1e0e46e8665f4dae1ef"

# etag: "4c24d138af462a8fa861ca083cd86e8490d2e1e0e46e8665f4dae1ef"
# expires: Sun, 14 Jun 2020 10:52:41 GMT
# last-modified: Sat, 13 Jun 2020 10:52:41 GMT
# strict-transport-security: max-age=31536000
# vary: Accept-Encoding
# x-esi-error-limit-remain: 100
# x-esi-error-limit-reset: 31
