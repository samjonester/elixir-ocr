defmodule OcrTest do
  use ExUnit.Case
  doctest Ocr

  test "prints an account number" do
    lines = [
      "    _  _     _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|",
      "  ||_  _|  | _||_|  ||_| _|",
      "                           "
    ]

    assert  Ocr.read_account_number(lines) == "123456789"
  end
end
