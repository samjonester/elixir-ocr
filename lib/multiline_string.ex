defmodule MultilineString do
  @moduledoc ~S'''
  Functions for processing multiline strings, such as:

  ```
  """
   | | | 
   |-| | 
   | | | 
  """
  ```

  '''

  @doc ~S'''
  Chunks a multiline string into characters of the specified size

  iex> lines = [
  ...> "| | | ",
  ...> "|-| | ",
  ...> "| | | "
  ...> ]
  iex> MultilineString.chunk(lines, 3)
  ["| ||-|| |", " |  |  | "]
  '''
  @spec chunk([String.t()], integer) :: [String.t()]
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
