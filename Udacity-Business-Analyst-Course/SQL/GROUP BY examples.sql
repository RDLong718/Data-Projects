-- SELECT a.name AS account_name, o.occurred_at AS date
-- FROM orders o
-- JOIN accounts a 
-- ON o.account_id = a.id
-- ORDER BY o.occurred_at ASC
-- LIMIT 1
-- SELECT CAST(SUM(o.total_amt_usd) AS money) AS total_sales, a.name AS company_name
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id = a.id
-- GROUP BY a.name
-- ORDER BY total_sales DESC
-- SELECT MAX(w.occurred_at) AS date, w.channel AS channel, a.name AS company_name
-- FROM web_events w
-- JOIN accounts a
-- ON w.account_id = a.id
-- GROUP BY w.channel, a.name
-- order by date desc
-- LIMIT 1
-- SELECT w.channel, COUNT(w.channel) AS times_used
-- FROM web_events w
-- GROUP BY w.channel
-- SELECT a.primary_poc
-- FROM web_events w 
-- JOIN accounts a
-- ON w.account_id = a.id
-- ORDER BY w.occurred_at ASC
-- LIMIT 1
-- SELECT a.name AS company_name, MIN(o.total_amt_usd) AS min_order
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id = a.id
-- GROUP BY a.name
-- ORDER BY min_order ASC
-- SELECT r.name AS region,
--     COUNT(s.id) AS num_sales_reps
-- FROM sales_reps s
--     JOIN region r ON s.region_id = r.id
-- GROUP BY r.name
-- ORDER BY num_sales_reps ASC
-- SELECT account_id, channel, COUNT(id) AS num_events
-- FROM web_events
-- GROUP BY account_id, channel
-- ORDER BY account_id, channel
-- SELECT a.name AS company_name,
--     AVG(o.standard_qty) AS avg_standard_qty,
--     AVG(o.poster_qty) AS avg_poster_qty,
--     AVG(o.gloss_qty) AS avg_glossy_qty
-- FROM orders o
--     JOIN accounts a ON o.account_id = a.id
-- GROUP BY a.name
-- SELECT a.name AS company_name,
--     AVG(o.standard_amt_usd) AS avg_standard,
--     AVG(o.poster_amt_usd) AS avg_poster,
--     AVG(o.gloss_amt_usd) AS avg_glossy
-- FROM orders o
--     JOIN accounts a ON o.account_id = a.id
-- GROUP BY a.name
-- SELECT s.name, w.channel, COUNT(w.channel) AS channel_count
-- FROM web_events w
-- JOIN accounts a
-- ON w.account_id = a.id
-- JOIN sales_reps s
-- ON a.sales_rep_id = s.id
-- GROUP BY s.name, w.channel
-- ORDER BY channel_count DESC, s.name
SELECT r.name AS region,
    w.channel AS channel,
    COUNT(w.channel) AS channel_count
FROM web_events w
    JOIN accounts a ON w.account_id = a.id
    JOIN sales_reps s ON a.sales_rep_id = s.id
    JOIN region r ON s.region_id = r.id
GROUP BY r.name,
    w.channel
ORDER BY channel_count DESC,
    r.name