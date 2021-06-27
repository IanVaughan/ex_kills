defmodule ExKills.Kills do
  use WebSockex

  @url "wss://zkillboard.com/websocket/"

  def start_link([]) do
    {:ok, pid} = WebSockex.start_link(@url, __MODULE__, :no_state)
    subscribe(pid)
    {:ok, pid}
  end

  def handle_connect(_conn, state) do
    IO.puts("Connected!")
    {:ok, state}
  end

  def handle_disconnect(connection_status_map, state) do
    IO.puts("Disconnected!")
    IO.inspect(connection_status_map)
    {:reconnect, state}
  end

  defp subscribtion_frame do
    subscription_msg =
      %{
        action: "sub",
        channel: "none:*"
        # channel: "killstream"
      }
      |> Jason.encode!()

    {:text, subscription_msg}
  end

  defp subscribe(pid) do
    WebSockex.send_frame(pid, subscribtion_frame())
    IO.puts("Subscribed!")
  end

  def handle_frame(_frame = {:text, msg}, state) do
    kill =
      msg
      |> Jason.decode!()

    %Kills.Kill{
      action: kill["action"],
      alliance_id: kill["alliance_id"],
      character_id: kill["character_id"],
      corporation_id: kill["corporation_id"],
      hash: kill["hash"],
      killID: kill["killID"],
      ship_type_id: kill["ship_type_id"],
      url: kill["url"]
    }
    |> Kills.Repo.insert()

    ExKills.Read.Ship.get(kill["ship_type_id"])
    ExKills.Read.Corp.get(kill["corporation_id"])
    ExKills.Read.Char.get(kill["character_id"])

    {:ok, state}
  end
end
