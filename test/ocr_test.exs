defmodule OcrTest do
  use ExUnit.Case
  doctest Ocr

  test "prints an account number" do
    lines = [
      " _     _  _  _  _  _  _  _ ",
      " _||_||_ |_||_| _||_||_ |_ ",
      " _|  | _||_||_||_ |_||_| _|",
      "                           "
    ]

    assert Ocr.read_account_number(lines) == {:ok, "345882865"}
  end

  test "produces an error when input doesn't have 4 lines" do
    lines = [
      "    _  _     _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|"
    ]

    assert {:error, _reason} = Ocr.read_account_number(lines)
  end

  test "produces an error when input isn't 27 characters long" do
    lines = [
      "    _  _     _  _  _  _ ",
      "  | _| _||_||_ |_   ||_|",
      "  ||_  _|  | _||_|  ||_|",
      "                        "
    ]

    assert {:error, _reason} = Ocr.read_account_number(lines)
  end
end
