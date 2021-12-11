

defmodule Day2Part1 do
  import FileUtils

  def run() do
    FileUtils.read_file_lines('lib/day_02/example_data.txt')
    |>Enum.reduce(%{depth: 0, horizontal: 0}, fn command, %{depth: depth, horizontal: horizontal} ->
      splited_command = String.split(command)
      op = Enum.at(splited_command, 0)
      units = Enum.at(splited_command, 1)
      case op do
        "forward" ->
          %{depth: depth, horizontal: horizontal + String.to_integer(units)}
        "down" ->
          %{depth: depth + String.to_integer(units), horizontal: horizontal}
        "up" ->
          %{depth: depth - String.to_integer(units), horizontal: horizontal}
      end
    end)
    |>Map.values()
    |>Enum.product()
  end
end
