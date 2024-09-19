# ElixirFlopFilter


## How to run


- `docker compose up -d` 
- `mix deps.get`
- `mix ecto.migrate`
- `mix run priv/repo/seeds.exs`
 

##  Create the dummy table

```
CREATE TABLE public."Payouts"(
	id text NOT NULL,
	account_id text NULL,
	currency text NULL,
	created timestamp(3) NULL,
	status text NULL
);

INSERT INTO public."Payouts"
(id, "account_id", created, currency, status)
VALUES('po_4', 'acct4', '2023-05-27 08:29:52.852', 'DKK', 'in_transit');

INSERT INTO public."Payouts"
(id, "account_id",created, currency, status)
VALUES('po_3', 'acct3','2023-06-27 09:57:14.932', 'DKK', 'succeeded');

INSERT INTO public."Payouts"
(id,"account_id", created, currency, status)
VALUES('po_2', 'acct2', '2023-09-14 19:01:04.585', 'DKK', 'in_transit');

INSERT INTO public."Payouts"
(id, "account_id", created, currency, status)
VALUES('po_1', 'acct_1', '2023-09-15 11:54:39.933', 'DKK', 'succeeded');
```


```
query Payouts {
    payouts(first: 2) {
        data {
            id
            currency
            created
            accountId
            status
        }
        meta {
            endCursor
            hasNextPage
            hasPreviousPage
            startCursor
        }
    }
}
```


