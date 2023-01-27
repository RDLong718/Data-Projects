-- SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
--  FROM orders
--  LIMIT 10;
-- SELECT account_id,
--     occurred_at,
--     standard_qty,
--     gloss_qty + poster_qty AS nonstandard_qty
-- FROM orders
-- SELECT id, account_id, (standard_amt_usd/standard_qty) AS unit_price
-- FROM orders
-- LIMIT 10;
SELECT id,
    account_id,
    poster_amt_usd / (
        standard_amt_usd + gloss_amt_usd + poster_amt_usd
    ) * 100 AS poster_perccent
FROM orders
LIMIT 10;