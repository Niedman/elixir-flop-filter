defmodule ElixirFlopFilterWeb.Schema do

  use Absinthe.Schema
  import_types Absinthe.Type.Custom

  alias ElixirFlopFilterWeb.Resolvers

  query do
    @desc "List all posts with pagination, sorting, and filtering"
    field :posts, :post_pagination do
      arg(:first, :integer, default_value: nil)
      arg(:after, :string, default_value: nil)
      arg(:last, :integer, default_value: nil)
      arg(:before, :string, default_value: nil)
      arg(:start_date, :naive_datetime)
      arg(:end_date, :naive_datetime)
      arg(:sort_by, :string, default_value: "created")
      arg(:sort_order, :string, default_value: "desc")
      arg(:filter, :filter_input)
      resolve &Resolvers.PostResolver.list_posts/3
    end

    @desc "List all payouts with pagination, sorting, and filtering"
    field :payouts, :payout_pagination do
      arg(:first, :integer, default_value: nil)
      arg(:after, :string, default_value: nil)
      arg(:last, :integer, default_value: nil)
      arg(:before, :string, default_value: nil)
      arg(:start_date, :naive_datetime)
      arg(:end_date, :naive_datetime)
      arg(:sort_by, :string, default_value: "created")
      arg(:sort_order, :string, default_value: "desc")
      arg(:filter, :filter_input)
      resolve &Resolvers.PayoutResolver.list_payouts/3
    end
  end

  # Define the Post Type

  object :post do
    field :id, non_null(:id)
    field :title, :string
    field :content, :string
    field :created, :naive_datetime
    field :updated, :naive_datetime
  end

  # Define Pagination and Sorting Types
  object :post_pagination do
    field :meta, :pagination_meta
    field :data, list_of(:post)
  end

  object :pagination_meta do
    field :end_cursor, :string
    field :has_next_page, :boolean
    field :has_previous_page, :boolean
    field :start_cursor, :string
  end

  input_object :filter_input do
    field :title, :string
    field :content, :integer
  end

  input_object :filter_input_payout do
    field :account_id, :string
    field :amount, :integer
    field :type, :string
    field :source_type, :string
    field :status, :string
    field :settlement_id, :string
  end

  object :payout_pagination do
    field :meta, :pagination_meta
    field :data, list_of(:payout)
  end

  object :payout do
    field :id, non_null(:id)
    field :account_id, :string
    field :created, :naive_datetime
    field :currency, :string
    field :status, :string
  end

end
