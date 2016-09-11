defmodule HackerNews.HackerNewsPost do
  use HackerNews.Web, :model
  alias HackerNews.HackerNewsPost
  alias HackerNews.Repo

  schema "hacker_news_post" do
    field :author, :string
    field :story_title, :string
    field :story_url, :string

    timestamps
  end

  @required_fields ~w(author story_title story_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def insert(post) do
    Repo.insert!(post)
  end

  def parse(%{"hits" => posts}), do: posts |> parse

  def parse(posts) when is_list(posts), do: posts |> Enum.map(&parse/1)

  def parse(data = %{"author" => author, "story_title" => story_title, "story_url" => story_url}) do
    %HackerNewsPost{author: author, story_title: story_title, story_url: story_url}
  end
end
