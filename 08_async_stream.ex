defmodule Cry do
  def cry(i) do
    :timer.sleep(1000)
    IO.puts i
    i
  end
end

start = :os.system_time(:millisecond)

stream = Task.async_stream([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], Cry, :cry, [], max_concurrency: 2)


IO.inspect Enum.to_list(stream), label: "stream"

diff = :os.system_time(:millisecond) - start
IO.inspect diff, label: "millisecond"