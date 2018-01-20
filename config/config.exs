use Mix.Config

config :wallaby, driver: Wallaby.Experimental.Chrome

config :blog_crawler, BlogCrawler.Scheduler,
       jobs: [
         # Every minute
         {"* * * * *", {BlogCrawler, :test_task, []}}
       ]
