defmodule ElixirFlopFilterWeb.Resolvers.PostResolver do
  alias ElixirFlopFilter.Blog
  alias Flop

  def list_posts(_parent, args, _resolution) do
    first = args[:first]
    last = args[:last]

    IO.inspect(first)

    if args[:after] != nil do
      IO.inspect(Flop.Cursor.decode!(args[:after]), label: "-------------> Start Cursor")
    end
    if args[:before] != nil do
      IO.inspect(Flop.Cursor.decode!(args[:before]), label: "-------------> Start Cursor")
    end

    sort_by_atom = String.to_existing_atom(args[:sort_by])
    sort_order =
      case args[:sort_order] do
        "desc" -> :desc
        "asc" -> :asc
      end

      params = %{
        order_by: [sort_by_atom],
        order_directions: [sort_order],
        # filters: filters
      }
      |> Map.merge(if last, do: %{last: last, before: args[:before]}, else: %{first: first, after: args[:after]})

      IO.inspect(params)

    case Blog.list_posts(params) do
      {:ok, {posts, meta}} ->
        {:ok, %{data: posts, meta: meta}}

      {:error, _} ->
        {:error, "Failed to retrieve posts"}
    end
  end
end
