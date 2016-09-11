defmodule HackerNews.SnycHackerNewsPosts do
  alias HackerNews.HackerNewsPost
  alias HackerNews.HackerNewsApi
  
  def sync do
    HackerNewsApi.posts |> Enum.map(&HackerNewsPost.insert/1)
  end
end
