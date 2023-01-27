-- SELECT orders.*,
--     accounts.*
-- FROM orders
--     JOIN accounts ON orders.account_id = accounts.id;
-- SELECT orders.*, accounts.name
-- FROM orders
-- JOIN accounts
-- ON orders.account_id = accounts.id;
-- SELECT 
--     accounts.name, orders.occurred_at
-- FROM orders
--     JOIN accounts ON orders.account_id = accounts.id;
-- SELECT accounts.*,
--     orders.*
-- FROM orders
--     JOIN accounts ON orders.account_id = accounts.id;
-- SELECT orders.standard_qty,
--     orders.poster_qty,
--     accounts.website,
--     accounts.primary_poc
-- FROM orders
--     JOIN accounts ON orders.account_id = accounts.id;
-- SELECT web_events.channel, accounts.name, orders.total
-- FROM web_events
-- JOIN accounts
-- ON web_events.account_id = accounts.id
-- JOIN orders
-- ON accounts.id = orders.account_id;
-- SELECT *
-- FROM web_events w
--     JOIN accounts a ON w.account_id = a.id
-- SELECT a.primary_poc, w.occurred_at, w.channel, a.name
-- FROM web_events w
-- JOIN accounts a
-- ON w.account_id = a.id
-- WHERE a.name = 'Walmart'
-- SELECT r.name AS region, s.name AS sales_rep, a.name AS account
-- FROM region r
-- JOIN sales_reps s 
-- ON r.id = s.region_id
-- JOIN accounts a
-- ON s.id = a.sales_rep_id 
-- ORDER BY a.name ASC
SELECT r.name AS region,
    a.name AS account,
    o.total_amt_usd /(o.total +.01) AS unit_price
FROM region r
    JOIN sales_reps s ON r.id = s.region_id
    JOIN accounts a ON s.id = a.sales_rep_id
    JOIN orders o ON a.id = o.account_id