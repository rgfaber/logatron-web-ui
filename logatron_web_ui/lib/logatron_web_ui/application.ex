defmodule LogatronWebUi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LogatronWebUi.Repo,
      # Start the Telemetry supervisor
      LogatronWebUiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LogatronWebUi.PubSub},
      # Start the Endpoint (http/https)
      LogatronWebUiWeb.Endpoint
      # Start a worker by calling: LogatronWebUi.Worker.start_link(arg)
      # {LogatronWebUi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LogatronWebUi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LogatronWebUiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
