# The repo is a mapping to a data store and the app's
# gateway to the data inside the database, translating
# what you'd like from the database into "database speak"
# through a defined public interface

# This is great because as long as an adapter for your
# DB is available, the repo can talk many different
# "database languages", but the public interface your
# app uses to talk to the repo remains the same
defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "Tomorrow Sex Will Be Good Again",
      description: "A book by Katherine Angel",
      ends_at: ~N[2022-01-01 12:00:00]
    },
    %Item{
      id: 2,
      title: "Weapons of Math Destruction",
      description: "A book by Cathy O'Neil",
      ends_at: ~N[2022-02-02 12:00:00]
    },
    %Item{
      id: 3,
      title: "Gone Girl",
      description: "A book by Gillian Flynn",
      ends_at: ~N[2022-03-03 12:00:00]
    }
  ]

  # Note that pattern matching is at play in this function signature
  # This function will only be called if the first argument is Item
  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
