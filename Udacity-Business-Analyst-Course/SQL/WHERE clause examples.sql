SELECT *
FROM orders
WHERE account_id = 4251
ORDER BY occurred_at
LIMIT 100;
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
ORDER BY gloss_amt_usd DESC
LIMIT 5;
SELECT *
FROM orders
WHERE total_amt_usd < 500
ORDER BY total_amt_usd DESC
LIMIT 10;
SELECT *
FROM accounts
WHERE name = 'United Technologies'
SELECT *
FROM accounts
WHERE name != 'United Technologies'
SELECT name,
    website,
    primary_poc
FROM accounts
WHERE name = 'Exxon Mobil'