defmodule ElixirFlopFilter.Repo do
  use Ecto.Repo,
    otp_app: :elixir_flop_filter,
    adapter: Ecto.Adapters.Postgres
end
