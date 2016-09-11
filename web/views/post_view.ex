defmodule HackerNews.PostView do
  use HackerNews.Web, :view

  def render("index.json", %{posts: posts}) do
    %{posts: render_many(posts, HackerNews.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id, author: post.author, story_title: post.story_title, story_url: post.story_url}
  end
end
