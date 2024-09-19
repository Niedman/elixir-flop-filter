# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirFlopFilter.Repo.insert!(%ElixirFlopFilter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias ElixirFlopFilter.Blog.Payout
alias ElixirFlopFilter.Repo
alias ElixirFlopFilter.Blog.Post

# Insert posts data
Repo.insert!(%Post{
  id: "1",
  title: "test1",
  content: "test1",
  created: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second),
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})

Repo.insert!(%Post{
  id: "2",
  title: "test2",
  content: "test2",
  created: ~N[2024-09-18 11:30:30],
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})

Repo.insert!(%Post{
  id: "3",
  title: "test3",
  content: "test3",
  created: ~N[2024-09-18 09:30:30],
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})

Repo.insert!(%Post{
  id: "4",
  title: "test4",
  content: "test4",
  created: ~N[2024-09-17 10:30:30],
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})

Repo.insert!(%Post{
  id: "5",
  title: "test5",
  content: "test5",
  created: ~N[2024-09-17 10:32:30],
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})

Repo.insert!(%Post{
  id: "6",
  title: "test6",
  content: "test6",
  created: ~N[2024-09-17 10:45:30],
  updated: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
})


# Insert payouts data
# Repo.insert!(%Payout{
#   id: "1",
#   account_id: "account_1",
#   currency: "DKK",
#   created: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second),
#   status: "succeeded"
# })

# # Insert payouts data
# Repo.insert!(%Payout{
#   id: "2",
#   account_id: "account_2",
#   currency: "DKK",
#   created: ~N[2024-09-18 11:30:30],
#   status: "in_transit"
# })

# # Insert payouts data
# Repo.insert!(%Payout{
#   id: "3",
#   account_id: "account_#",
#   currency: "NOK",
#   created: ~N[2024-09-18 09:30:30],
#   status: "succeeded"
# })

# Repo.insert!(%Payout{
#   id: "4",
#   account_id: "test4",
#   currency: "EUR",
#   created: ~N[2024-09-17 10:30:30],
#   status: "succeeded"
# })

# Repo.insert!(%Payout{
#   id: "5",
#   account_id: "test5",
#   currency: "test5",
#   created: ~N[2024-09-17 10:32:30],
#   status: "succeeded"
# })

# Repo.insert!(%Payout{
#   id: "6",
#   account_id: "test6",
#   currency: "SEK",
#   created: ~N[2024-09-17 10:45:30],
#   status: "succeeded"
# })
