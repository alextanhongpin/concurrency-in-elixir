defmodule API do
  def random do
    time = :rand.uniform(1000)
    :timer.sleep(time)
    time
  end
end

[
  Task.async(&API.random/0),
  Task.async(&API.random/0),
  Task.async(&API.random/0)
]
|> Enum.map(&Task.await/1)
|> IO.inspect