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

    assert {_, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "?"]} = AccountNumber.parse_ascii_chars(chars)
  end

  test "with valid numerals prints the account number" do
    account = {:ok, ["1", "2", "3"]}
    assert AccountNumber.print(account) == "123"
  end

  test "with invalid numerals returns illegible tuple" do
    chars = ["-"]
    assert {:illegible, _} = AccountNumber.parse_ascii_chars(chars)
  end

  test "with invalid numerals prints ILL" do
    account_number = {:illegible, ["1", "2", "3", "4", "5", "6", "7", "8", "?"]}

    assert AccountNumber.print(account_number) == "12345678? ILL"
  end

  test "with invalid checksum prints ERR" do
    account_number = {:invalid_checksum, ["1", "2", "3"]}

    assert AccountNumber.print(account_number) == "123 ERR"
  end

  test "with invalid checksum returns invalid checksup tuple" do
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
      " _|"
    ]

    assert {:invalid_checksum, ["0", "1", "2", "3"]} = AccountNumber.parse_ascii_chars(chars)
  end
end
