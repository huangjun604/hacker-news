defmodule HackerNews.HackerNewsPostTest do
  use HackerNews.ModelCase

  alias HackerNews.HackerNewsPost

  @valid_attrs %{author: "some content", story_title: "some content", story_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = HackerNewsPost.changeset(%HackerNewsPost{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = HackerNewsPost.changeset(%HackerNewsPost{}, @invalid_attrs)
    refute changeset.valid?
  end
end
