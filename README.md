# BlogCrawler

Get a list of all posts from my own blog.

## Setup

1. Install Chrome

2. Install ChromeDriver

3. Install and start Redis

4. `mix deps.get`

5. `mix run --no-halt` / `iex -S mix`

6. Go to localhost:4000 - verk dashboard

## Parts

1. Job scheduling (`quantum`)

Queue a job to check posts every minute.

2. Job processing (`verk`, `verk_web`)

Queue and run jobs that cannot be simply scheduled.
