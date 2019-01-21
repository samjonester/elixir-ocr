defmodule MultilineString do
  def chunk(lines, size) do
    lines
    |> chunk_strings(size)
    |> zip_lines
  end

  defp chunk_strings(strings, size) do
    strings
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&Enum.chunk_every(&1, size))
  end

  defp zip_lines(lines) do
    lines
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.join/1)
  end
end
