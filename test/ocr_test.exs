defmodule OcrTest do
  use ExUnit.Case
  doctest Ocr

  test "reads all account numerals" do
    account_lines = [
      "    _  _     _  _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|",
      "                              "
    ]

    assert Ocr.read_account_number(account_lines) == "1234567890"
  end
end
