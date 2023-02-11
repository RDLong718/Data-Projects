-- SELECT channel,
--     AVG(events) AS average_events
-- FROM (
--         SELECT DATE_TRUNC('day', occurred_at) AS day,
--             channel,
--             COUNT(*) as events
--         FROM web_events
--         GROUP BY 1,
--             2
--     ) sub
-- GROUP BY channel
-- ORDER BY 2 DESC;
/*Let’s leverage the same question you saw ‘ In Your First Subquery ’ but this time try building a solution that uses the With Subquery*/
/*Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales*/
-- WITH t1 AS 
-- (SELECT s.name rep_name, r.name AS region_name, SUM(o.total_amt_usd) total_amount
-- FROM region r
-- JOIN sales_reps s ON r.id = s.region_id
-- JOIN accounts a ON s.id = a.sales_rep_id
-- JOIN orders o
-- ON a.id = o.account_id
-- GROUP BY 1, 2
-- ORDER BY 3 DESC),
-- t2 AS
-- (SELECT region_name, MAX(total_amount) AS total_amount
-- FROM t1
-- GROUP BY 1)
-- SELECT t1.rep_name, t1.region_name, t1.total_amount
-- FROM t1
-- JOIN t2 ON t1.region_name = t2.region_name AND t1.total_amount = t2.total_amount
-- ORDER BY 1, 2 DESC;
/*For the region with the largest sales total_amt_usd, how many total orders were placed?*/
-- WITH t1 AS 
-- (SELECT r.name region_name, SUM(o.total_amt_usd) total_amount
-- FROM region r
-- JOIN sales_reps s ON r.id = s.region_id
-- JOIN accounts a ON s.id = a.sales_rep_id
-- JOIN orders o
-- ON a.id = o.account_id
-- GROUP BY 1),
-- t2 AS
-- (SELECT MAX(total_amount)
-- FROM t1)
-- SELECT r.name region_name, COUNT(o.total) total_orders
-- FROM region r
-- JOIN sales_reps s ON r.id = s.region_id
-- JOIN accounts a ON s.id = a.sales_rep_id
-- JOIN orders o
-- ON a.id = o.account_id
-- GROUP BY 1
-- HAVING SUM(o.total_amt_usd) = (SELECT * FROM t2)
/*For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper,
 how many accounts still had more in total purchases ?*/
-- WITH t1 AS (
--     SELECT a.name account_name,
--         SUM(o.standard_qty) total_std,
--         SUM(o.total) total
--     FROM accounts a
--         JOIN orders o ON o.account_id = a.id
--     GROUP BY 1
--     ORDER BY 2 DESC
--     LIMIT 1
-- ), t2 AS (
--     SELECT a.name
--     FROM orders o
--         JOIN accounts a ON a.id = o.account_id
--     GROUP BY 1
--     HAVING SUM(o.total) > (
--             SELECT total
--             FROM t1
--         )
-- )
-- SELECT COUNT(*)
-- FROM t2;
/*For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?*/
-- WITH t1 AS (
-- SELECT a.name account_name, SUM(o.total_amt_usd) lifetime_amount
-- FROM accounts a
-- JOIN orders o ON o.account_id = a.id
-- GROUP BY 1
-- ORDER BY 2 DESC
-- LIMIT 1
-- ),
-- t2 AS (SELECT a.name account_name, w.channel, COUNT(w.channel) channel_count
-- FROM accounts a
-- JOIN web_events w
-- ON a.id = w.account_id
-- GROUP BY 1,2
-- HAVING a.name LIKE (SELECT account_name FROM t1)
-- ORDER BY 3 DESC)
-- SELECT * FROM t2
/*What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts ?*/
-- WITH t1 AS (
-- SELECT a.id account_id, a.name account_name, SUM(o.total_amt_usd) lifetime_amount
-- FROM accounts a
-- JOIN orders o ON o.account_id = a.id
-- GROUP BY 1,2
-- ORDER BY 3 DESC
-- LIMIT 10
-- )
-- SELECT AVG(lifetime_amount) AS lifetime_avg
-- FROM t1
/*What is the lifetime average amount spent in terms of total_amt_usd,
 including only the companies that spent more per order,
 on average, than the average of all orders.*/
WITH t1 AS (
    SELECT AVG(o.total_amt_usd) avg_all
    FROM orders o
        JOIN accounts a ON a.id = o.account_id
),
t2 AS (
    SELECT o.account_id,
        AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (
            SELECT *
            FROM t1
        )
)
SELECT AVG(avg_amt)
FROM t2;