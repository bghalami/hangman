defmodule Dictionary do
  @moduledoc false

  alias Dictionary.WordList

  defdelegate random_word(), to: WordList

end
