

defmodule Day1Part1 do
  import FileUtils

  def process_measurement(last_measurement, measurement_list) do
    if length(measurement_list) == 0 do
      0
    else
      [current_measurement | list] = measurement_list
      if current_measurement > last_measurement do
        1 + process_measurement(current_measurement, list)
      else
        process_measurement(current_measurement, list)
      end
    end
  end

  def run() do
    [last_measurement | list]= Enum.map(FileUtils.read_file_lines('data.txt'), &String.to_integer/1)
    process_measurement(last_measurement, list)
  end
end
