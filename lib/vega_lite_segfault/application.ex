defmodule VegaLiteSegfault.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VegaLiteSegfaultWeb.Telemetry,
      VegaLiteSegfault.Repo,
      {DNSCluster, query: Application.get_env(:vega_lite_segfault, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: VegaLiteSegfault.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: VegaLiteSegfault.Finch},
      # Start a worker by calling: VegaLiteSegfault.Worker.start_link(arg)
      # {VegaLiteSegfault.Worker, arg},
      # Start to serve requests, typically the last entry
      VegaLiteSegfaultWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VegaLiteSegfault.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VegaLiteSegfaultWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
