defmodule PhangmanWeb.Views.Helpers.GameStateHelper do

  import Phoenix.HTML, only: [ raw: 1 ]

  @responses %{
    :won          => { :success, "You Won!"},
    :lost         => { :danger, "You Lost!"},
    :good_guess   => { :success, "Good Guess!"},
    :bad_guess    => { :warning, "Bad Guess!"},
    :already_used => { :info, "You Already Guessed That!"},
  }

  def word_so_far(tally) do
    tally.guessed |> Enum.join(", ")
  end

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  defp alert(nil), do: ""
  defp alert({class, message}) do
    """
    <div class="alert alert-#{class}">
      #{message}
    </div>
    """
    |> raw()
  end
end
