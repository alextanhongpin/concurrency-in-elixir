defmodule Statuses do
  def map(urls) do
    caller = self()
    urls
      # Map the URLs to a spawn process
      |> Enum.map(&(spawn(fn -> process(&1, caller) end)))
      |> Enum.map(fn pid ->
          # Receive the response from the PID
          receive do
            {^pid, url, status} -> {url, status}
          end
        end)
  end

  def process(url, caller) do
    status = 
      case HTTPPoison.get(url) do
        {:ok, %HTTPPoison.Response{status_code: status_code}} ->
          status_code
        {:error, %HTTPPoison.Error{reason: reason}} ->
          {:error, reason}
      end
    
    # Send message back to caller with result
    send(caller, {self(), url, status})
  end
  
end