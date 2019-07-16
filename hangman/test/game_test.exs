defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "letters are lower case" do
    game = Game.new_game()

    assert Enum.all?(game.letters, fn el -> Regex.match?(~r/[a-z]/, el) end)
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [ :won, :lost ] do
      game =  Game.new_game() |> Map.put(:game_state, state)
      assert { ^game, _tally } = Game.make_move(game, "x")
    end
  end

  test "first occurence of letter is not already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurence of letter is already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a guessed word is a won game" do
    moves = [
      {"w", :good_guess},
      {"i", :good_guess},
      {"b", :good_guess},
      {"l", :good_guess},
      {"e", :won},
    ]

    game = Game.new_game("wibble")

    moves
    |> Enum.reduce(game, fn ({guess, state}, new_game) ->
      { new_game, _tally } = Game.make_move(new_game, guess)
      assert new_game.game_state == state
      new_game
      end )
  end

  test "bad guesses lose game" do
    moves = [
      {"w", :bad_guess},
      {"i", :bad_guess},
      {"b", :bad_guess},
      {"l", :bad_guess},
      {"r", :bad_guess},
      {"p", :bad_guess},
      {"e", :lost},
    ]

    game = Game.new_game("x")

    moves
    |> Enum.reduce(game, fn ({guess, state}, new_game) ->
      { new_game, _tally } = Game.make_move(new_game, guess)
      assert new_game.game_state == state
      new_game
      end )
  end
end
