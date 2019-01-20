defmodule AccountNumber do
  defstruct numerals: nil

  def print(account_number) do
    Enum.join(account_number.numerals)
  end
end
