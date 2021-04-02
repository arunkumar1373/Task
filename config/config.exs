# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tasks,
  ecto_repos: [Tasks.Repo]

# Configures the endpoint
config :tasks, TasksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iMiXHZz1QBkzjliWCCpok7EtowW3C0O+HKGnW8y/ERO21wRwMjTHdTdJXw5P1csY",
  render_errors: [view: TasksWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Tasks.PubSub,
  live_view: [signing_salt: "7+969+O3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
