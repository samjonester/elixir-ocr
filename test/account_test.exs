defmodule AccountTest do
  use ExUnit.Case

  test "splits numerals in an account number" do
    account_lines = [
      "    _ ",
      "  | _|",
      "  ||_ ",
      "      "
    ]

    assert Account.split_numerals(account_lines) == [
      "   "<>
      "  |"<>
      "  |",
      " _ "<>
      " _|"<>
      "|_ "
    ]
  end

  test "to_account_char with invalid value" do
    numeral =
      "   "<>
      " - "<>
      "   "

    assert Account.to_account_char(numeral) == "?"
  end
end
