defmodule HackerNews.API.PostControllerTest do
  use HackerNews.ConnCase

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, post_path(conn, :index)
    assert json_response(conn, 200)["posts"] == []
  end
end
