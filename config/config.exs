# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :migrations_sample,
  ecto_repos: [MigrationsSample.Repo]

# Configures the endpoint
config :migrations_sample, MigrationsSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9QeyhpnzxvKJq3AFvsZzowDWw3nnADLNi/HIAvTGfD9VNoS2I5ZtPFftfrhLWnxK",
  render_errors: [view: MigrationsSampleWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MigrationsSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
