defmodule Account do
  @moduledoc """

  """

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

  def split_numerals(account_lines) do
    account_lines
    |> Enum.take(3)
    |> chunk_lines
    |> zip_lines
  end

  defp chunk_lines(lines, size \\ 3) do
    lines
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&Enum.chunk_every(&1, size))
  end

  defp zip_lines(lines) do
    lines
    |> Enum.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.join/1)
  end

  def to_account_char(numeral) do
    @numerals
    |> Map.get(numeral, "?")
  end
end
