defmodule BigIntegerLiveView.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BigIntegerLiveViewWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BigIntegerLiveView.PubSub},
      # Start the Endpoint (http/https)
      BigIntegerLiveViewWeb.Endpoint
      # Start a worker by calling: BigIntegerLiveView.Worker.start_link(arg)
      # {BigIntegerLiveView.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BigIntegerLiveView.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BigIntegerLiveViewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
