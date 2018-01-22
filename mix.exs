defmodule BlogCrawler.Mixfile do
  use Mix.Project

  def project do
    [
      app: :blog_crawler,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BlogCrawler, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:wallaby, "~> 0.19.2"},
      {:quantum, ">= 2.2.1"},
      {:verk, "~> 1.0"},
      {:verk_web, "~> 1.0"}
    ]
  end
end
