defmodule AccountNumberTest do
  use ExUnit.Case

  test "translates all account numerals" do
    chars = [
      " _ "<>
      "| |"<>
      "|_|",
      "   "<>
      "  |"<>
      "  |",
      " _ "<>
      " _|"<>
      "|_ ",
      " _ "<>
      " _|"<>
      " _|",
      "   "<>
      "|_|"<>
      "  |",
      " _ "<>
      "|_ "<>
      " _|",
      " _ "<>
      "|_ "<>
      "|_|",
      " _ "<>
      "  |"<>
      "  |",
      " _ "<>
      "|_|"<>
      "|_|",
      " _ "<>
      "|_|"<>
      " _|",
      "   "<>
      " - "<>
      "   "
    ]

    assert AccountNumber.from_ascii_chars(chars).numerals ==
      ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "?"]
  end

  test "with valid numerals prints the account number" do
    account_number = %AccountNumber{
      numerals: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    }

    assert AccountNumber.print(account_number) == "123456789"
  end

  test "with invalid numerals prints ILL" do
    account_number = %AccountNumber{
      numerals: ["1", "2", "3", "4", "5", "6", "7", "8", "?"]
    }

    assert AccountNumber.print(account_number) == "12345678? ILL"
  end
end
