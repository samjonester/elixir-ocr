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
    %AccountNumber{
      numerals: Enum.map(chars, &to_numeral/1)
    }
  end

  def decorate_checksum(account_number) do
    cond do
      illegible?(account_number) ->
        account_number
      true ->
        %AccountNumber{
          account_number |
          checksum: calculate_checksum(account_number)
        }
    end
  end

  defp calculate_checksum(%AccountNumber{numerals: numerals}) do
    numerals
    |> Enum.map(&String.to_integer/1)
    |> Enum.zip(9..1)
    |> Enum.map(fn ({n, d}) -> n * d end)
    |> Enum.sum
    |> Integer.mod(11)
  end

  defp to_numeral(char) do
    Map.get(@numerals, char, "?")
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
