defmodule ElixirFlopFilter.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string
      add :content, :text
      add :created, :naive_datetime
      add :updated, :naive_datetime

    end

    # create table(:payouts, primary_key: false) do
    #   add :id, :string, primary_key: true
    #   add :account_id, :string
    #   add :currency, :text
    #   add :created, :naive_datetime
    #   add :status, :string

    # end
  end
end
