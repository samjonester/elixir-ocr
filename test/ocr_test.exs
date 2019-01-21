defmodule OcrTest do
  use ExUnit.Case
  doctest Ocr

  test "prints an account number" do
    account_lines = [
      "    _ ",
      "  | _|",
      "  ||_ ",
      "      "
    ]

    actual = account_lines
    |> Ocr.read_account_number
    |> AccountNumber.print

    assert actual == "12"
  end

  test "prints ILL when result contains illegible characters" do
    account_lines = [
      "      ",
      "  | _ ",
      "  |   ",
      "      " ]

    actual = account_lines
    |> Ocr.read_account_number
    |> AccountNumber.print

    assert actual == "1? ILL"
  end
end
