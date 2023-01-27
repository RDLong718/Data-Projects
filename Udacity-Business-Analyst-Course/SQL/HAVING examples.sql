-- SELECT account_id,
--     SUM(total_amt_usd) AS sum_total_amt_usd
-- FROM orders
-- GROUP BY 1
-- HAVING SUM(total_amt_usd) >= 250000
-- SELECT s.id AS sales_rep , s.name AS sales_rep_name, COUNT(*) num_accounts
-- FROM accounts a
--     JOIN sales_reps s 
--     ON s.id = a.sales_rep_id
-- GROUP BY 1,2
-- HAVING COUNT(*) > 5
-- ORDER BY 3 ;
-- SELECT a.id AS account_id, a.name AS account_name, COUNT(*)
-- FROM accounts a
--     JOIN orders o
--     ON o.account_id = a.id
-- GROUP BY 1,2
-- HAVING COUNT(*) > 20
-- ORDER BY 3 ;
-- SELECT a.id AS account_id,
--     a.name AS account_name,
--     COUNT(*) num_orders
-- FROM accounts a
--     JOIN orders o ON o.account_id = a.id
-- GROUP BY 1,
--     2
-- ORDER BY 3 DESC
-- LIMit 1
-- SELECT a.id AS account_id,
--     a.name AS account_name,
--     CAST(SUM(o.total_amt_usd) AS money) AS sum_total_amt_usd
-- FROM accounts a
--     JOIN orders o ON o.account_id = a.id
-- GROUP BY 1, 2
-- HAVING SUM(o.total_amt_usd) > 30000
-- ORDER BY 3;
-- SELECT a.id AS account_id,
--     a.name AS account_name,
--     CAST(SUM(o.total_amt_usd) AS money) AS sum_total_amt_usd
-- FROM accounts a
--     JOIN orders o ON o.account_id = a.id
-- GROUP BY 1,
--     2
-- HAVING SUM(o.total_amt_usd) < 1000
-- ORDER BY 3 ASC
-- SELECT a.id AS account_id,
--     a.name AS account_name,
--     CAST(SUM(o.total_amt_usd) AS money) AS sum_total_amt_usd
-- FROM accounts a
--     JOIN orders o ON o.account_id = a.id
-- GROUP BY 1, 2
-- ORDER BY 3 DESC
-- LIMIT 1
-- SELECT a.id AS account_id,
--     a.name AS account_name,
--     CAST(SUM(o.total_amt_usd) AS money) AS sum_total_amt_usd
-- FROM accounts a
--     JOIN orders o ON o.account_id = a.id
-- GROUP BY 1,
--     2
-- ORDER BY 3 ASC
-- LIMIT 1
-- SELECT a.id AS account_id, a.name AS account_name, w.channel, COUNT(*) AS use_of_channel
-- FROM accounts a
-- JOIN web_events w ON a.id=w.account_id
-- GROUP BY 1,2,3
-- HAVING w.channel = 'facebook' AND COUNT(*) > 6
-- Order BY 4 
-- SELECT a.id AS account_id, a.name AS account_name, w.channel, COUNT(*) AS use_of_channel
-- FROM accounts a
-- JOIN web_events w ON a.id=w.account_id
-- GROUP BY 1,2,3
-- HAVING w.channel = 'facebook'
-- ORDER BY 4 DESC
-- LIMIT 1
SELECT a.id AS account_id,
    a.name AS account_name,
    w.channel,
    COUNT(w.channel) AS use_of_channel
FROm accounts a
    JOIN web_events w ON a.id = w.account_id
GROUP BY 1,
    2,
    3
ORDER BY 4 DESC
LIMIT 10