defmodule ElixirFlopFilter.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirFlopFilter.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> ElixirFlopFilter.Blog.create_post()

    post
  end
end