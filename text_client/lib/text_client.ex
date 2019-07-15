defmodule TextClient do
  @moduledoc false
  
  alias TextClient.Interact

  defdelegate start(), to: Interact

end
