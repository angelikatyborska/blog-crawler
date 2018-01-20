defmodule BlogCrawlerTest do
  use ExUnit.Case
  doctest BlogCrawler

  test "greets the world" do
    assert BlogCrawler.hello() == :world
  end
end
