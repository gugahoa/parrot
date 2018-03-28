defmodule ParrotWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "room:*", ParrotWeb.RoomChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(%{"user_id" => userId, "app_id" => appId}, socket) do
    socket =
      socket
      |> assign(:user_id, userId)
      |> assign(:app_id, appId)
    {:ok, socket}
  end
  def connect(params, socket) do
    userId = Map.get(params, "user_id")
    appId = Map.get(params, "app_id")

    socket =
      socket
      |> assign(:user_id, userId)
      |> assign(:app_id, appId)
    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     ParrotWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end