import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :onehundredsixtyeight_hours, OnehundredsixtyeightHours.Repo,
  username: "postgres",
  password: "postgres",
  database: "onehundredsixtyeight_hours_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :onehundredsixtyeight_hours, OnehundredsixtyeightHoursWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "t2KmP1Ux6/uO8VV0Igg3nQt3MbSx22BLiKFSB4W/K2ryxlmJc23jC1zujoqqgSU2",
  server: false

# In test we don't send emails.
config :onehundredsixtyeight_hours, OnehundredsixtyeightHours.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
