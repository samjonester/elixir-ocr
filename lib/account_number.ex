defmodule AccountNumber do
  @moduledoc """
  Support for parsing account numbers from ascii character blocks & printing the parsed results
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
    " _ | ||_|" => "0"
  }

  def parse_ascii_chars(chars) do
    with numerals = Enum.map(chars, &Map.get(@numerals, &1, "?")) do
      cond do
        illegible?(numerals) ->
          {:illegible, numerals}

        invalid_checksum?(numerals) ->
          {:invalid_checksum, numerals}

        true ->
          {:valid, numerals}
      end
    end
  end

  def print({:valid, numerals}) do
    print(numerals)
  end

  def print({:illegible, numerals}) do
    "#{print(numerals)} ILL"
  end

  def print({:invalid_checksum, numerals}) do
    "#{print(numerals)} ERR"
  end

  def print(numerals) do
    Enum.join(numerals)
  end

  defp illegible?(numerals) do
    Enum.member?(numerals, "?")
  end

  defp invalid_checksum?(numerals) do
    Checksum.calculate(numerals) != 0
  end
end
