defmodule ReportsGenerator do
  def build(filename) do
    #opening a file with case.
    # case File.read("reports/#{filename}") do
    #     {:ok, result } -> result
    #     {:error, reason } -> reason
    # end
    filename
    |> ReportsGenerator.Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line , report -> sum_values(line, report) end)
    # |> File.read
    # |> handle_file()
  end

  defp sum_values([id, _foodname, price], report), do: Map.put(report, id, report[id] + price)
  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
