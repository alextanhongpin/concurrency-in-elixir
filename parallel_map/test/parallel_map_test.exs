defmodule ParallelMapTest do
  use ExUnit.Case
  # doctest ParallelMap

  test "parallel status map" do
    urls = [
      url1 = "http://www.fakeresponse.com/api/?sleep=2",
      url2 = "http://www.fakeresponse.com/api/?sleep=1",
      url3 = "http://www.fakeresponse.com/api/?status=500",
      url4 = "https://www.leighhalliday.com",
      url5 = "https://www.reddit.com"
    ]

    assert ParallelMap.map(urls) == [
      {url1, 200},
      {url2, 200},
      {url3, 500},
      {url4, 200},
      {url5, 200}
    ]
  end
end
