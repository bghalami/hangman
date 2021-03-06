defmodule TextClient.Summary do
  def display(game = %{ tally: tally}) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "Guesses left: #{tally.turns_left}\n",
      "Letters Guessed: #{Enum.join(tally.guessed, " ")}"
    ]
    game
  end
end
