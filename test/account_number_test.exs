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
end
