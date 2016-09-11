defmodule HackerNews.HackerNewsApi do
  alias HackerNews.HackerNewsPost

  def posts do
    url = "http://hn.algolia.com/api/v1/search_by_date?query=elixir"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, response} = Poison.decode body
        HackerNewsPost.parse(response)
    end
  end
end
