defmodule Account do
  @moduledoc """

  """

  def to_account_char(numeral) do
    @numerals
    |> Map.get(numeral, "?")
  end
end
