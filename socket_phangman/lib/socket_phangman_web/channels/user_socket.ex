defmodule SocketPhangmanWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "hangman:*", SocketPhangmanWeb.HangmanChannel
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
