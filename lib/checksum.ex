defmodule Checksum do

  def calculate(values) do
    values
    |> Enum.map(&String.to_integer/1)
    |> IO.inspect
    |> Enum.zip(9..1)
    |> Enum.map(fn ({n, d}) -> n * d end)
    |> Enum.sum
    |> Integer.mod(11)
  end
end
