defmodule MultilineStringTest do
  use ExUnit.Case
  doctest MultilineString

  test "chunks multiline string into chars" do
    lines = [
      "..  ",
      "  --"
    ]

    assert MultilineString.chunk(lines, 2) == ["..  ", "  --"]
  end
end
