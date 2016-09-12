defmodule HackerNews.HackerNewsPostTest do
  use HackerNews.ModelCase

  alias HackerNews.HackerNewsPost

  @valid_attrs %{author: "Stephen", story_title: "some content", story_url: "some content", object_id: 1842543}
  @invalid_attrs %{}
  @valid_json %{"author" => "Stephen", "story_title" => "Elixir Australia", "story_url" => "http://hello", "objectID" => "1842543"}

  test "changeset with valid attributes" do
    changeset = HackerNewsPost.changeset(%HackerNewsPost{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = HackerNewsPost.changeset(%HackerNewsPost{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "parse/1 parses the post successfully when post data given" do
    post = HackerNewsPost.parse @valid_json

    assert post.author == "Stephen"
    assert post.story_title == "Elixir Australia"
    assert post.story_url == "http://hello"
    assert post.object_id == 1842543
  end

  test "insert/1 inserts the post successfully when the post does not exist" do
    post = HackerNewsPost.parse @valid_json
    post_db = HackerNewsPost.insert post

    assert post_db.author == post.author
  end

  test "insert/1 not insert the post when the post exists" do
    post = HackerNewsPost.parse @valid_json
    HackerNewsPost.insert post
    post_db = HackerNewsPost.insert post
    
    assert post_db == nil
  end
end
