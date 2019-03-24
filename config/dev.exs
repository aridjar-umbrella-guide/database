use Mix.Config

config :database, Database.Repo,
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DB_DEV"),
  hostname: System.get_env("POSTGRES_HOST"),
  pool_size: 10

# This part will only be used if we don't want to use Docker, and if you don't have env set up.
# config :database, Database.Repo,
#   username: "user",
#   password: "password",
#   database: "test_dev",
#   hostname: "127.0.0.1",
#   pool_size: 10
