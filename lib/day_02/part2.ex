

defmodule Day2Part2 do
  import FileUtils

  def run() do
    FileUtils.read_file_lines('lib/day_02/data.txt')
    |>Enum.reduce(%{depth: 0, horizontal: 0, aim: 0}, fn command, %{depth: depth, horizontal: horizontal, aim: aim} = state ->
      splited_command = String.split(command)
      op = Enum.at(splited_command, 0)
      units = Enum.at(splited_command, 1)
      case op do
        "forward" ->
          %{state | depth: depth + (aim * String.to_integer(units)), horizontal: horizontal + String.to_integer(units)}
        "down" ->
          %{state | aim: aim + String.to_integer(units)}
        "up" ->
          %{state | aim: aim - String.to_integer(units)}
      end
    end)
    |>Map.drop([:aim])
    |>Map.values()
    |>Enum.product()
  end
end
