-- SELECT id,
--     occurred_at,
--     total_amt_usd
-- FROM orders
-- order by occurred_at 
-- LIMIT 10;
-- SELECT id,
--     account_id,
--     total_amt_usd
-- FROM orders
-- ORDER BY total_amt_usd DESC
-- LIMIT 5;
-- SELECT id,
--     account_id,
--     total_amt_usd
-- FROM orders
-- ORDER BY total_amt_usd ASC
-- LIMIT 20;
SELECT account_id,
    total_amt_usd
FROM orders
ORDER BY account_id DESC,
    total_amt_usd DESC