defmodule AccountNumber do
  defstruct numerals: nil, checksum: nil

  @numerals %{
    "     |  |" => "1",
    " _  _||_ " => "2",
    " _  _| _|" => "3",
    "   |_|  |" => "4",
    " _ |_  _|" => "5",
    " _ |_ |_|" => "6",
    " _   |  |" => "7",
    " _ |_||_|" => "8",
    " _ |_| _|" => "9",
    " _ | ||_|" => "0",
  }

  def from_ascii_chars(chars) do
    %AccountNumber{ numerals: Enum.map(chars, &Map.get(@numerals, &1, "?")) }
    |> AccountNumber.decorate_checksum
  end

  def decorate_checksum(account_number) do
    cond do
      illegible?(account_number) ->
        account_number
      true ->
        %AccountNumber{
          account_number |
          checksum: Checksum.calculate(account_number.numerals)
        }
    end
  end

  def print(%AccountNumber{} = account_number) do
    cond do
       illegible?(account_number) ->
        "#{print_numerals(account_number)} ILL"
      invalid_checksum?(account_number) ->
        "#{print_numerals(account_number)} ERR"
      true ->
        print_numerals(account_number)
    end
  end

  defp print_numerals(%AccountNumber{numerals: numerals}) do
    Enum.join(numerals)
  end

  defp illegible?(%AccountNumber{numerals: numerals}) do
    Enum.member?(numerals, "?")
  end

  defp invalid_checksum?(%AccountNumber{checksum: checksum}) do
    checksum != 0
  end
end
