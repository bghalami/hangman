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
    |> render( "game_field.html", tally: tally, conn: conn )
  end

  def make_move(conn, params) do
    guess = params["make_move"]["guess"]
    tally =
      conn
      |> get_session(:game)
      |> Hangman.make_move(guess)
    put_in(conn.params["make_move"]["guess"], "")
    |> render("game_field.html", tally: tally, conn: conn )
  end

end
