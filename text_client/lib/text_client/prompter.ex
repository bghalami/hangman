defmodule TextClient.Prompter do

  alias TextClient.State

  def accept_move(game = %State{}) do
    IO.gets("Your guess: ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended because #{reason}")
    exit(:normal)
  end
  defp check_input(:eof, _) do
    IO.puts("Looks like you gave up...")
    exit(:normal)
  end
  defp check_input(input, game = %State{}) do
    trimmed_input = String.trim(input)
    cond do
      trimmed_input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :guess, trimmed_input)
      true ->
        IO.puts "Please enter a single lowercase letter"
        accept_move(game)
    end
  end
end
