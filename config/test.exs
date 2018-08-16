use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :migrations_sample, MigrationsSampleWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :migrations_sample, MigrationsSample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "migrations_sample_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
