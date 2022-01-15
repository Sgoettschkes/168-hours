defmodule OnehundredsixtyeightHours do
  def run() do
    result =
      File.stream!("tmp/data.csv")
      |> CSV.decode!(separator: ?,)
      # The first 4 rows are not data
      |> Enum.drop(4)
      # The first row only contains the time
      |> Enum.map(fn row -> Enum.drop(row, 1) end)
      |> List.flatten()
      |> Enum.filter(fn elem -> elem != "" end)
      |> Enum.reduce(%{}, fn tag, acc -> Map.update(acc, tag, 1, &(&1 + 1)) end)
      |> Enum.sort(fn {_key, val}, {_key2, val2} -> val > val2 end)
      # Every entry is worth 15 minutes
      |> Enum.map(fn {key, val} -> [key, pretty_print_time(val * 15)] end)

    file = File.open!("tmp/result.csv", [:write, :utf8])
    result |> CSV.encode() |> Enum.each(&IO.write(file, &1))

    {:ok}
  end

  defp pretty_print_time(minutes) when minutes < 60, do: "#{minutes}m"

  defp pretty_print_time(minutes) do
    "#{floor(minutes / 60)}h #{rem(minutes, 60)}m"
  end
end