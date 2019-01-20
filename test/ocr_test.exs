defmodule OcrTest do
  use ExUnit.Case
  doctest Ocr

  test "reads an account number" do
    account_number =
      "    _  _     _  _  _  _  _ \n" <>
      "  | _| _||_||_ |_   ||_||_|\n" <>
      "  ||_  _|  | _||_|  ||_| _|\n"

    assert Ocr.read_account_number(account_number) == "123456789"
  end
end
