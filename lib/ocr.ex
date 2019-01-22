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
  @spec read_account_number([String.t()]) :: {:ok, String.t()} | {:error, String.t()}
  def read_account_number(account_lines) do
    cond do
      invalid_line_count?(account_lines) ->
        {:error, @moduledoc}

      invalid_line_length?(account_lines) ->
        {:error, @moduledoc}

      true ->
        {:ok, read(account_lines)}
    end
  end

  defp invalid_line_count?(lines) do
    length(lines) != 4
  end

  defp invalid_line_length?(account_lines) do
    account_lines
    |> Enum.any?(fn l -> String.length(l) != 27 end)
  end

  defp read(account_lines) do
    account_lines
    |> Enum.take(3)
    |> MultilineString.chunk(3)
    |> AccountNumber.parse_ascii_chars()
    |> AccountNumber.print()
  end
end
