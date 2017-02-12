# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :scrapper,
  ecto_repos: [Scrapper.Repo]

# Configures the endpoint
config :scrapper, Scrapper.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V3DHS7Ye1oHDG0Sgr9DW2IbCnhq742emf8i8ILo28x0cTmlskOMyOC5zJbB96GJE",
  render_errors: [view: Scrapper.ErrorView, accepts: ~w(json)],
  pubsub: [name: Scrapper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
