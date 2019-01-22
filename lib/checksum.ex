defmodule Checksum do
  @moduledoc """
  Calculates the checksum for an enumerable of numerical strings
  """

  @doc """
  Calculate the checksum for an enumerable of numerical strings

  For example, given the list of strings `["1", "2", "3"]`, the checksum is calculated like so:

  n: 1  2  3
  d: 3  2  1

  checksum: n1*d1 + n2*d2 + n3*d3
  example:  1 * 3 + 2 * 2 + 3 * 1
  equals:   10

  iex> Checksum.calculate(["1", "2", "3"])
  10
  """
  @spec calculate([String.t()]) :: integer
  def calculate(values) do
    values
    |> Enum.map(&String.to_integer/1)
    |> Enum.zip(length(values)..1)
    |> Enum.map(fn {n, d} -> n * d end)
    |> Enum.sum()
    |> Integer.mod(11)
  end
end
