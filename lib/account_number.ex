defmodule AccountNumber do
  defstruct numerals: nil, status: nil

  def print(%AccountNumber{numerals: numerals, status: nil}) do
    Enum.join(numerals)
  end

  def print(%AccountNumber{numerals: numerals, status: status}) do
    printable_status =
      status
      |> Atom.to_string
      |> String.upcase

    Enum.join(numerals)<>" #{printable_status}"
  end
end
