defmodule ElixirFlopFilterWeb.Resolvers.PayoutResolver do
  alias ElixirFlopFilter.Blog


  def list_payouts(_parent, args, _resolution) do
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

    case Blog.list_payouts(params) do
      {:ok, {payouts, meta}} ->
        {:ok, %{data: payouts, meta: meta}}

      {:error, _} ->
        {:error, "Failed to retrieve payouts"}
    end
  end
end
