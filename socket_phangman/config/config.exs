# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :socket_phangman, SocketPhangmanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sk9EB8BBrly3TEvwWUfoYDSpd0lq+57Y2lCjPLRpdNRciSRQ9bV6upFMP2Y/gOxy",
  render_errors: [view: SocketPhangmanWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SocketPhangman.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
