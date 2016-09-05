defmodule HackerNews.Repo.Migrations.CreateHackerNewsPost do
  use Ecto.Migration

  def change do
    create table(:hacker_news_post) do
      add :author, :string
      add :story_title, :string
      add :story_url, :string

      timestamps
    end

  end
end
