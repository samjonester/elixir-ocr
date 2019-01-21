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

  def parse_ascii_chars(chars) do
    numerals = Enum.map(chars, &Map.get(@numerals, &1, "?"))
    cond do
      illegible?(numerals) ->
        {:illegible, numerals}
      invalid_checksum?(numerals) ->
        {:invalid_checksum, numerals}
      true ->
        {:ok, numerals}
    end
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

  def print({:ok, numerals}) do
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

  defp print_numerals(%AccountNumber{numerals: numerals}) do
    Enum.join(numerals)
  end

  defp illegible?(%AccountNumber{numerals: numerals}) do
    Enum.member?(numerals, "?")
  end

  defp illegible?(numerals) do
    Enum.member?(numerals, "?")
  end

  defp invalid_checksum?(%AccountNumber{checksum: checksum}) do
    checksum != 0
  end

  defp invalid_checksum?(numerals) do
    Checksum.calculate(numerals) != 0
  end
end
