send(self(), :hello)

out = receive do
  :hello -> "Hello to you too!"
  unknown -> ~s(Received unknwon message: "#{unknown}")
end

IO.inspect out, label: "out"