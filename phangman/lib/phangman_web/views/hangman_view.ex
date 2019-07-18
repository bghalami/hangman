defmodule PhangmanWeb.HangmanView do
  use PhangmanWeb, :view

  import PhangmanWeb.Views.Helpers.GameStateHelper

  def new_game_button(conn) do
    button("New Game", to: Routes.hangman_path(conn, :create_game))
  end

  def game_over?(%{game_state: game_state}) do
    game_state in [ :won, :lost ]
  end

  def turn(left, target) when target >= left, do: "opacity: 1"
  def turn(_left, _target), do: "opacity: 0.1"

end
