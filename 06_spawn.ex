defmodule API do
  def random do
    time = :rand.uniform(1000)
    :timer.sleep(time)
    time
  end
end

parent = self()

spawn(fn() -> 
  send(parent, API.random())
end)

receive do
  random -> IO.puts("Received #{random}")
  after 500 -> IO.puts "No response received"
end