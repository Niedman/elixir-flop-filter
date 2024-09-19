defmodule ElixirFlopFilter.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [
      :title,
      :content
    ],
    sortable: [:title, :content, :created, :updated],
    max_limit: 10000
  }

  @primary_key false
  schema "posts" do
    field :id, :string, primary_key: true
    field :title, :string
    field :content, :string
    field :created, :naive_datetime
    field :updated, :naive_datetime

  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :created, :updated])
    |> validate_required([:title, :content])
  end
end
