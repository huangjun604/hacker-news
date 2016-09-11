defmodule HackerNews.Repo.Migrations.AddObjectIdToHackerNewsPost do
  use Ecto.Migration

  def change do
    alter table(:hacker_news_post) do
      add :object_id, :integer
    end
  end
end
