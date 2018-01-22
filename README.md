# BlogCrawler

Get a list of all posts from my own blog.

## Setup

1. Install Chrome

2. Install ChromeDriver `brew install chromedriver`

3. Install and start Redis.

## Parts

1. Job scheduling (`quantum`)

Queue a job to check posts every minute.

2. Job processing (`verk`, `verk_web`)

Queue and run jobs that cannot be simply scheduled.
