defmodule MultilineStringTest do
  use ExUnit.Case

  test "chunks multiline string into chars" do
    lines = [
      "..  ",
      "  --"
    ]

    assert MultilineString.chunk(lines, 2) == ["..  ", "  --"]
  end
end
