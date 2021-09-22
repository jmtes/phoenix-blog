defmodule Auction.Repo do
  # The following lets you not have to import all the
  # the functions Ecto uses yourself, keeping boilerplate
  # to a minimum
  use Ecto.Repo,
    # The following allows this module to be a supervised
    # worker
    otp_app: :auction,
    adapter: Ecto.Adapters.Postgres
end
