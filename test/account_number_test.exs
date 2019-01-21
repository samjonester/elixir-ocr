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
      numerals: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
      checksum: 0
    }

    assert AccountNumber.print(account_number) == "123456789"
  end

  test "with invalid numerals prints ILL" do
    account_number = %AccountNumber{
      numerals: ["1", "2", "3", "4", "5", "6", "7", "8", "?"]
    }

    assert AccountNumber.print(account_number) == "12345678? ILL"
  end

  test "decorate with checksum" do
    account_number = %AccountNumber{
      numerals: ["3", "4", "5", "8", "8", "2", "8", "6", "5"]
    }

    assert AccountNumber.decorate_checksum(account_number).checksum == 0
  end

  test "with invalid checksum prints ERR" do
    account_number = %AccountNumber{
      numerals: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
      checksum: 9
    }

    assert AccountNumber.print(account_number) == "123456789 ERR"
  end
end
