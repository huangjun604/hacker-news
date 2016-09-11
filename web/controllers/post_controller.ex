defmodule HackerNews.PostController do
  use HackerNews.Web, :controller
  alias HackerNews.HackerNewsPost

  def index(conn, _params) do
    posts = Repo.all(HackerNewsPost)
    render(conn, "index.json", posts: posts)
  end
end
