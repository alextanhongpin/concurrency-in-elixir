defmodule ParallelMap do
  @moduledoc """
  Documentation for ParallelMap.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ParallelMap.hello
      :world

  """
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
      case HTTPoison.get(url) do
        {:ok, %HTTPoison.Response{status_code: status_code}} ->
          status_code
        {:error, %HTTPoison.Error{reason: reason}} ->
          {:error, reason}
      end
    
    # Send message back to caller with result
    send(caller, {self(), url, status})
  end
end
