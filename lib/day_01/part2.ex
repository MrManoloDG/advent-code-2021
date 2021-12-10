
defmodule Day1Part2 do
  import FileUtils

  def run() do
    Enum.map(FileUtils.read_file_lines('lib/day_01/data.txt'), &String.to_integer/1)
    |>Enum.reduce(%{previous: nil, increases: 0, window: []}, fn current, %{previous: previous, increases: increases, window: window} = state ->
      if Enum.count(window) < 2 do
        new_window = window ++ [current]
        %{state | window: new_window}
      else
        if previous do
          current_window_sum = Enum.sum(window)
          new_window = Enum.drop(window, 1) ++ [current]
          if current_window_sum > previous do
            %{previous: current_window_sum, increases: increases + 1, window: new_window }
          else
            %{previous: current_window_sum, increases: increases, window: new_window }
          end
        else
          new_window = window ++ [current]
          %{previous: Enum.sum(window), increases: increases, window: new_window }
        end
      end
    end)
    |>Map.get(:increases)
  end
end
