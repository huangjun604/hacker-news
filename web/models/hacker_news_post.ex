defmodule HackerNews.HackerNewsPost do
  use HackerNews.Web, :model

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
end
