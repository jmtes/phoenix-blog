defmodule Auction.Item do
  use Ecto.Schema

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    # You can only change the item's title, description, and end time
    |> Ecto.Changeset.cast(params, [:title, :description, :ends_at])
    # This ensures that either the item struct or the changeset
    # contains a title
    |> Ecto.Changeset.validate_required(:title)
  end
end
