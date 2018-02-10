defmodule API do
  def random do
    time = :rand.uniform(1000)
    :timer.sleep(time)
    time
  end
end

IO.inspect [API.random, API.random, API.random]