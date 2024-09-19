defmodule ElixirFlopFilter.Blog.Payout do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [
      :account_id,
      :currency
    ],
    sortable: [:account_id, :currency, :created, :status],
    max_limit: 10000
  }

  @primary_key false
  schema "Payouts" do
    field :id, :string, primary_key: true
    field :account_id, :string
    field :currency, :string
    field :created, :naive_datetime
    field :status, :string

  end

  @doc false
  def changeset(payout, attrs) do
    payout
    |> cast(attrs, [:account_id, :currency, :created, :status])
    |> validate_required([:account_id, :created])
  end
end
