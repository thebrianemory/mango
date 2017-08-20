defmodule MangoWeb.UserSocket do
  use Phoenix.Socket

  transport :websocket, Phoenix.Transports.WebSocket

  channel "pos", MangoWeb.BotChannel

  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "socket_login", token) do
      {:ok, user_id} ->
        socket = assign(socket, :user_id, user_id)
        {:ok, socket}
      {:error, _} ->
        :error
    end
  end

  def id(_socket), do: nil
end
