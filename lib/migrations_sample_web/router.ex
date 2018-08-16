defmodule MigrationsSampleWeb.Router do
  use MigrationsSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MigrationsSampleWeb do
    pipe_through :api
  end
end
