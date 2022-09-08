import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :memory, MemoryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "k3A6xGtFKivThVDg8RE8xCS8NEPXdM3hGC3hSZjNq+MEDJgxpv3uR0qAKqNexTCg",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
