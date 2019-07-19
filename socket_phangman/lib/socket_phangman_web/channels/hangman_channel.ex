defmodule SocketPhangmanWeb.HangmanChannel do

  require Logger

  use Phoenix.Channel

  defimpl Jason.Encoder, for: [MapSet] do
    def encode(struct, opts) do
      Jason.Encode.list(Enum.to_list(struct), opts)
    end
  end

  def join("hangman:game", _, socket) do
    game   = Hangman.new_game()
    socket = assign(socket, :game, game)
    Logger.error("You dun goofed")
    { :ok, socket }
  end
  def join("hangman:" <> _nothing, _, _socket) do
    { :error, Logger.error("You dun goofed") }
  end

  def handle_in("tally", _, socket) do
    game = socket.assigns.game
    tally = Hangman.tally(game)
    push(socket, "tally", tally)
    { :noreply, socket }
  end
end
