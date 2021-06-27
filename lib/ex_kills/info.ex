defmodule ExKills.Info do
  use WebSockex

  @url "wss://zkillboard.com:2096"

  def start_link do
    {:ok, pid} = WebSockex.start_link(@url, __MODULE__, :no_state)
    subscribe(pid)
    {:ok, pid}
  end

  def handle_connect(_conn, state) do
    IO.puts("Connected!")
    {:ok, state}
  end

  defp subscribtion_frame do
    subscription_msg =
      %{
        action: "sub",
        channel: "public"
      }
      |> Jason.encode!()

    {:text, subscription_msg}
  end

  defp subscribe(pid) do
    WebSockex.send_frame(pid, subscribtion_frame())
    IO.puts("Subscribed!")
  end

  def handle_frame(_frame = {:text, msg}, state) do
    msg
    |> Jason.decode!()

    {:ok, state}
  end
end
