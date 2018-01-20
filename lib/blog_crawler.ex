defmodule BlogCrawler do
  use Application

  import Supervisor.Spec

  def start(_type, _args) do

    children = [
      worker(BlogCrawler.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: BlogCrawler.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def test_task do
    IO.puts("test task")
  end
end
