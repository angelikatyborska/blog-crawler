defmodule BlogCrawler.TestWorker do
  require Logger

  def perform(arg) do
    Logger.info("test spawned task: #{inspect arg}")
  end
end
