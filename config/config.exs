use Mix.Config

config :wallaby, driver: Wallaby.Experimental.Chrome

config :blog_crawler, BlogCrawler.Scheduler,
       jobs: [
         # Every minute
         {"* * * * *", {BlogCrawler, :test_task, []}}
       ]

config :verk, queues: [default: 25, priority: 10],
              max_retry_count: 10,
              poll_interval: 5000,
              start_job_log_level: :info,
              done_job_log_level: :info,
              fail_job_log_level: :info,
              node_id: "1",
              redis_url: "redis://127.0.0.1:6379"

config :verk_web, VerkWeb.Endpoint,
       http: [port: 4000],
       server: true, #-> this is to tell VerkWeb to start a standalone application!
       pubsub: [name: VerkWeb.PubSub, adapter: Phoenix.PubSub.PG2] # The pubsub adapter to use (default)
