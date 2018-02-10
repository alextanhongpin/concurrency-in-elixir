# parent = self()

spawn_link(fn() ->
  raise("The api is down")
end)

receive do
  random -> IO.puts "Received #{random}"
end