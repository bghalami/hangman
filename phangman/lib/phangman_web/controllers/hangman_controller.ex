defmodule PhangmanWeb.HangmanController do
  use PhangmanWeb, :controller

  def new_game(conn, _params) do
    render(conn, "new_game.html", conn: conn)
  end

  def create_game(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    conn
    |> put_session( :game, game )
    |> render( "game_field.html", tally: tally )
  end

  def word_so_far(tally) do
    tally.guessed |> Enum.join(", ")
  end
end
