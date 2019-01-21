defmodule AccountNumber do
  defstruct numerals: nil, status: nil

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

  defp to_numeral(char) do
    Map.get(@numerals, char, "?")
  end

  def print(%AccountNumber{numerals: numerals, status: nil}) do
    Enum.join(numerals)
  end

  def print(%AccountNumber{numerals: numerals, status: status}) do
    printable_status =
      status
      |> Atom.to_string
      |> String.upcase

    Enum.join(numerals)<>" #{printable_status}"
  end
end
