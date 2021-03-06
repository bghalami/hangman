defmodule TextClient.Player do

  alias TextClient.{State, Summary, Prompter, Mover}

  # won, lost, good guess, bad guess, already used, initializing
  def play(%State{tally: %{ game_state: :won}}) do
    exit_with_message("You won!")
  end
  def play(%State{tally: %{ game_state: :lost}, game_service: gs}) do
    exit_with_message("Sorry, you lost. The word was \"#{Enum.join(gs.letters, "")}\"")
  end

  def play(game = %State{tally: %{ game_state: :good_guess}}) do
    continue_with_message(game, "Good guess!")
  end

  def play(game = %State{tally: %{ game_state: :bad_guess}}) do
    continue_with_message(game, "Sorry that isn't in the word")
  end

  def play(game = %State{tally: %{ game_state: :already_used}}) do
    continue_with_message(game, "You've already used that letter")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  defp exit_with_message(message) do
    IO.puts message
    exit(:normal)
  end

end
