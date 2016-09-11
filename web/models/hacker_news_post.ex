defmodule HackerNews.HackerNewsPost do
  use HackerNews.Web, :model
  alias HackerNews.HackerNewsPost
  alias HackerNews.Repo

  schema "hacker_news_post" do
    field :author, :string
    field :story_title, :string
    field :story_url, :string
    field :object_id, :integer

    timestamps
  end

  @required_fields ~w(author story_title story_url object_id)
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
    unless Repo.get_by(HackerNewsPost, object_id: post.object_id) do
      Repo.insert!(post)    
    end
  end

  def parse(%{"hits" => posts}), do: posts |> parse

  def parse(posts) when is_list(posts), do: posts |> Enum.map(&parse/1)

  def parse(data = %{"author" => author, "story_title" => story_title, "story_url" => story_url, "objectID" => object_id}) do
    %HackerNewsPost{author: author, story_title: story_title, story_url: story_url, object_id: String.to_integer(object_id)}
  end
end
