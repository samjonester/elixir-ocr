defmodule Ocr do
  @moduledoc """

  Account number format:

  ```
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|

  ```
  Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each entry contain an account number written using pipes and underscores, and the fourth line is blank. Each account number should have 9 digits, all of which should be in the range 0-9.
  """

  @doc """
  Reads an account number in the form of 4 lines of characters and produces a serializable version of the account number

  """
  def read_account_number(account_lines) do
    account_lines
    |> MultilineString.chunk(3)
    |> AccountNumber.from_ascii_chars
    |> with_ill_status
  end

  defp with_ill_status(account_number) do
    if Enum.member?(account_number.numerals, "?") do
      %{ account_number | status: :ill }
    else
      account_number
    end
  end
end
