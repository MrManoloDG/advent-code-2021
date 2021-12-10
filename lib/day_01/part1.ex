

defmodule Day1Part1 do
  import FileUtils

  def run() do
    result = Enum.map(FileUtils.read_file_lines('data.txt'), &String.to_integer/1)
    |>Enum.reduce(%{previous: nil, increases: 0}, fn current, %{previous: previous, increases: increases} ->

      if previous do
        if current > previous do
          %{previous: current, increases: increases + 1}
        else
          %{previous: current, increases: increases}
        end
      else
        %{previous: current, increases: increases}
      end
    end)
    result.increases
  end
end