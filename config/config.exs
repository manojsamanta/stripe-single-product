# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :single_product,
  ecto_repos: [SingleProduct.Repo]

# Configures the endpoint
config :single_product, SingleProductWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vt9IkGxPkpVqk+FZAWVBJWSb3ykbbR5LM6LZuGMx+V6TW9HkW92BC3QkEaQ35qaq",
  render_errors: [view: SingleProductWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SingleProduct.PubSub,
  live_view: [signing_salt: "HDIDXpao"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :stripity_stripe, api_key: System.get_env("STRIPE_SECRET_KEY")
