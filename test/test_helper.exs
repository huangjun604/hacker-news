ExUnit.start

Mix.Task.run "ecto.create", ~w(-r HackerNews.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r HackerNews.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(HackerNews.Repo)

