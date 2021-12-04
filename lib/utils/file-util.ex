defmodule FileUtils do
  def read_file(file_name) do
    {:ok, contents} = File.read(file_name)
    contents
  end

  def read_file_lines(file_name) do
    contents = String.split(read_file(file_name), "\n")
  end
end
