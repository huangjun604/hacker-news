defmodule HackerNews.PageController do
  use HackerNews.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
