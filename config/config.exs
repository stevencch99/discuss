# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, DiscussWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qQRNWnPZGVXYCtqgJVNMzrfoP/gFxIAGYaYD75hm00qj2O3pIH/N7t0TW21AjxFO",
  render_errors: [view: DiscussWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Discuss.PubSub,
  live_view: [signing_salt: "zUTHUcN9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

  config :ueberauth, Ueberauth.Strategy.Github.Oauth,
    client_id: "08e6f12f4c9e67b19bea",
    client_secret: "005ca87804f852a889ec7fafcf0a0eeacb488617"
