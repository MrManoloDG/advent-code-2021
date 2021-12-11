

defmodule Day3Part1 do
  import FileUtils

  def run() do
    list_bits = FileUtils.read_file_lines('lib/day_03/data.txt')
    number_rows = Enum.count(list_bits)
    list_bits
    |>Enum.map(fn x -> Enum.map(String.split(x, "", trim: true), &to_bit/1) end)
    |>Enum.reduce(fn row, sum ->
      if sum do
        Enum.zip_with(row, sum, &(&1 + &2))
      else
        row
      end
    end)
    |>Enum.reduce(%{gamma: "", epsilon: ""}, fn bites_to_1, %{gamma: gamma, epsilon: epsilon} ->
      if bites_to_1 > number_rows/2 do
        %{gamma: gamma <> "1", epsilon: epsilon <> "0"}
      else
        %{gamma: gamma <> "0", epsilon: epsilon <> "1"}
      end
    end)
    |>Map.values()
    |>Enum.map(&String.to_integer(&1,2))
    |>Enum.product()
  end

  defp to_bit("1"), do: 1
  defp to_bit(_), do: 0
end
