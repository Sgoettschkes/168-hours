defmodule OnehundredsixtyeightHours.CsvTest do
  use ExUnit.Case

  describe "parse/1" do
    test "csv parses file" do
      result =
        File.stream!("priv/test/data.csv")
        |> OnehundredsixtyeightHours.Csv.parse()

      assert List.flatten(result) == result
      assert List.first(result) == "Task 1"
    end
  end

  describe "calculate_minutes/1" do
    test "csv calculates correct minutes" do
      result =
        ["Task 1", "Task 2", "Task 1", "Task 3", "Task 1", "Task 2"]
        |> OnehundredsixtyeightHours.Csv.calculate_minutes()

      assert length(result) == 3
      assert List.first(result) == ["Task 1", "45m"]
    end
  end
end
