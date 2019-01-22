defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  test "calculates checksum" do
    assert Checksum.calculate(["3", "4", "5", "8", "8", "2", "8", "6", "5"]) == 0
  end
end
