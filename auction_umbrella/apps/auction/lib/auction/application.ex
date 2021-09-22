defmodule Auction.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Auction.Worker.start_link(arg)
      # {Auction.Worker, arg}
      # Tells Elixir we want Auction.Repo to act as a worker
      # Now if the DB connection is severed for any reason,
      # Elixir can try to reconnect
      {Auction.Repo, []},
      {Phoenix.PubSub, [name: Auction.PubSub, adapter: Phoenix.PubSub.PG2]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Auction.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
