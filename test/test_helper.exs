# Explicitly get a connection before each test
# By default the test is wrapped in a transaction
:ok = Ecto.Adapters.SQL.Sandbox.checkout(Database.Repo)

# The :shared mode allows a process to share
# its connection with any other process automatically
Ecto.Adapters.SQL.Sandbox.mode(Database.Repo, {:shared, self()})

ExUnit.start()
