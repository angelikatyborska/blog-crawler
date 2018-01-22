defmodule BlogCrawler do
  require Logger

  use Application

  import Supervisor.Spec

  def start(_type, _args) do

    children = [
      supervisor(Verk.Supervisor, []),
      worker(BlogCrawler.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: BlogCrawler.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def test_task do
    Logger.info("test reoccuring task")
    Verk.enqueue(%Verk.Job{queue: :default, class: "BlogCrawler.TestWorker", args: [%{a: "A"}], max_retry_count: 5})
  end
end
