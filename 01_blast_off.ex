defmodule BlastOff do
  def get_ready do
    receive do
      :countdown ->
        Enum.each(10..0, fn(i) ->
          IO.puts i
          :timer.sleep(1000)
        end)
        IO.puts "Blast off!"
    end
  end
end

# iex 01_blast_off.ex
# pid1 = spawn(BlastOff, :get_ready, [])
# pid2 = spawn(BlastOff, :get_ready, [])
# :observer.start
# Enum.each([pid1, pid2], fn(pid) -> send(pid, :countdown) end)
# Output:
# 10
# 10
# :ok
# 9
# 9
# 8
# 8
# 7
# 7
# 6
# 6
# 5
# 5
# 4
# 4
# 3
# 3
# 2
# 2
# 1
# 1
# 0
# 0
# Blast off!
# Blast off!