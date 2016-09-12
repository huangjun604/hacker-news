# HackerNews

Hacker News is a web application built by phoenix framework. It will:

  * Fetch the hacker news posts from remote api(http://hn.algolia.com/api/v1/search_by_date?query=elixir)
  * Insert the data into Postgres database
  * Create api access via `GET \posts`

## Usage

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Testing

To run test, invoke:

```
$ mix test
```

## Copyright

Copyright © 2016 Stephen Huang
