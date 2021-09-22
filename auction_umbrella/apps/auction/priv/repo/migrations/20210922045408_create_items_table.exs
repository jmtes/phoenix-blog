defmodule Auction.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  # If you only provide a change/0 function, Ecto is
  # smart enough to know how the database changes as
  # it goes up and down

  # Typically you'll only need change/0, but you'd
  # go for up/0 and down/0 when you want finer-grained
  # control over how tables are built and torn down,
  # i.e. removing specific data
  def change do
    create table("items") do
      add(:title, :string)
      add(:description, :string)
      add(:ends_at, :utc_datetime)
      timestamps()
    end
  end
end
