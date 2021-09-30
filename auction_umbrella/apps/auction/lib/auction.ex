defmodule Auction do
  @moduledoc """
  Auction keeps the contexts that define your domain
  and business logic.
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Auction.Item

  # This is an example of a module attribute
  # Here, @repo is being used as a sort of constant value
  # When the module is compiled, the value of the module attribute is
  # read and inserted into any code that references it
  # Because they're compiled, they can't be set or changed at runtime
  @repo Auction.Repo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end

  def create_item(attrs) do
    Item
    |> struct(attrs)
    |> @repo.insert()
  end

  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> @repo.update()
  end

  # We pattern match to ensure item is an Item struct to
  # ensure we don't delete any non-Items that may get
  # passed into the function
  def delete_item(%Item{} = item), do: @repo.delete(item)
end
