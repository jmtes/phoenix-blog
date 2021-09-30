defmodule Auction.Item do
  use Ecto.Schema

  import Ecto.Changeset

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  defp validate(:ends_at, ends_at_date) do
    case DateTime.compare(ends_at_date, DateTime.utc_now()) do
      :lt -> [ends_at: "ends_at cannot be in the past"]
      _ -> []
    end
  end

  def changeset(item, params \\ %{}) do
    item
    # You can only change the item's title, description, and end time
    |> cast(params, [:title, :description, :ends_at])
    # This ensures that either the item struct or the changeset
    # contains a title
    |> validate_required(:title)
    # This ensures the title is at least 3 chars long
    |> validate_length(:title, min: 3)
    # This ensures the description is no longer than 200 chars
    |> validate_length(:description, max: 200)
    # This ensures the end date is not in the past
    |> validate_change(:ends_at, &validate/2)
  end
end
