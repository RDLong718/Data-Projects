-- SELECT o.account_id,
--     a.name,
--     CASE
--         WHEN o.standard_qty = 0
--         OR o.standard_qty IS NULL THEN 0
--         ELSE o.standard_amt_usd / o.standard_qty
--     END AS unit_price
-- FROM orders o
--     JOIN accounts a ON a.id = o.account_id
-- LIMIT 10;
-- SELECT id,
--     account_id,
--     occurred_at,
--     channel,
--     CASE
--         WHEN channel = 'facebook' THEN 'yes'
--     END AS is_facebook
-- FROM web_events
-- ORDER BY occurred_at
-- SELECT id,
--     account_id,
--     occurred_at,
--     channel,
--     CASE
--         WHEN channel = 'facebook' THEN 'yes'
--         ELSE 'no'
--     END AS is_facebook
-- FROM web_events
-- ORDER BY occurred_at
-- SELECT id,
--     account_id,
--     occurred_at,
--     channel,
--     CASE
--         WHEN channel = 'facebook'
--         OR channel = 'direct' THEN 'yes'
--         ELSE 'no'
--     END AS is_facebook
-- FROM web_events
-- ORDER BY occurred_at
-- SELECT account_id,
--     occurred_at,
--     total,
--     CASE
--         WHEN total > 500 THEN 'Over 500'
--         WHEN total > 300 THEN '301 - 500'
--         WHEN total > 100 THEN '101 - 300'
--         ELSE '100 or under'
--     END AS total_group
-- FROM orders
-- SELECT account_id,
--     occurred_at,
--     total,
--     CASE
--         WHEN total > 500 THEN 'Over 500'
--         WHEN total > 300
--         AND total <= 500 THEN '301 - 500'
--         WHEN total > 100
--         AND total <= 300 THEN '101 - 300'
--         ELSE '100 or under'
--     END AS total_group
-- FROM orders
-- SELECT CASE WHEN total > 500 THEN 'Over 500'
-- ELSE '500 or Under' END AS total_group,
-- COUNT(*) AS order_count
-- FROM orders
-- GROUP BY total_group
/* Write a query to display for each order,
 the account ID,
 the total amount of the order,
 and the level of the order - ‘ Large ’
 or ’ Small ’ - depending on if the order is $3000
 or more,
 or smaller than $3000. */
SELECT account_id,
    total_amt_usd,
    CASE
        WHEN total_amt_usd >= 3000 THEN 'Large'
        ELSE 'Small'
    END AS order_level
FROM orders
ORDER BY total_amt_usd DESC;