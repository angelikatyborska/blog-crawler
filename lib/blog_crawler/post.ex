defmodule BlogCrawler.Post do
  use Wallaby.DSL

  import Wallaby.Query, only: [css: 1, css: 2]
  import Wallaby.Element, only: [attr: 2]

  alias BlogCrawler.Post

  defstruct url: nil, title: nil, excerpt: nil, date: nil, tags: nil

  def read_posts(limit \\ nil) do
    {:ok, session} = Wallaby.start_session
    posts =
      session
      |> visit("https://angelika.me")
      |> all(css(".post-preview"))

    limit =
      case limit do
        limit when is_integer(limit) -> limit
        _ -> Enum.count(posts)
      end

    posts
    |> Enum.slice(0, limit)
    |> Enum.map(fn (preview) ->
      from_preview(preview)
    end)
  end

  defp from_preview(preview) do
    %Post{}
    |> get_title_and_url(preview)
    |> get_excerpt(preview)
    |> get_date(preview)
    |> get_tags(preview)
  end

  defp get_title_and_url(%Post{} = post, preview) do
    link = find(preview, css("h2 a", count: 1))
    title = attr(link, "text")
    url = attr(link, "href")

    %Post{post | title: title, url: url}
  end

  defp get_excerpt(%Post{} = post, preview) do
    excerpt =
      preview
      |> find(css(".post-preview-description", count: 1))
      |> attr("innerHTML")

    %Post{post | excerpt: excerpt}
  end

  defp get_date(%Post{} = post, preview) do
    string_date =
      preview
      |> find(css(".date", count: 1))
      |> attr("innerHTML")

    [_, day, month, year] = Regex.run(~r/(\d+)\s(\w+)\s(\d{4})/, string_date)

    {:ok, date} = Date.new(
      String.to_integer(year),
      get_month(month),
      String.to_integer(day)
    )

    %Post{post | date: date}
  end

  defp get_tags(%Post{} = post, preview) do
    tags =
      preview
      |> all(css(".tags a"))
      |> Enum.map(fn (tag) -> attr(tag, "text") end)

    %Post{post | tags: tags}
  end

  defp get_month("January"), do: 1
  defp get_month("February"), do: 2
  defp get_month("March"), do: 3
  defp get_month("April"), do: 4
  defp get_month("May"), do: 5
  defp get_month("June"), do: 6
  defp get_month("July"), do: 7
  defp get_month("August"), do: 8
  defp get_month("September"), do: 9
  defp get_month("October"), do: 10
  defp get_month("November"), do: 11
  defp get_month("December"), do: 12
end
