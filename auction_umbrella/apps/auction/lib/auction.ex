defmodule Auction do
  @moduledoc """
  Auction keeps the contexts that define your domain
  and business logic.
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Auction.{FakeRepo, Item}

  # This is an example of a module attribute
  # Here, @repo is being used as a sort of constant value
  # When the module is compiled, the value of the module attribute is
  # read and inserted into any code that references it
  # Because they're compiled, they can't be set or changed at runtime
  @repo FakeRepo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end
end
