defmodule Bongo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BongoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bongo.PubSub},
      # Adding Mongo
      %{
        id: Mongo,
        start: {Mongo, :start_link, [[
          name: :mongo, 
          database: "test-db", 
          pool_size: 3
        ]]}
      },
      # Start the Endpoint (http/https)
      BongoWeb.Endpoint
      # Start a worker by calling: Bongo.Worker.start_link(arg)
      # {Bongo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bongo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BongoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
