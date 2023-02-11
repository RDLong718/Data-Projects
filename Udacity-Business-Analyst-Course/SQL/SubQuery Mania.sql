/*What is the top channel used by each account to market products ? How often was that same channel used ?*/
-- WITH T1 AS (
--     SELECT a.id account_id,
--         a.name account_name,
--         w.channel channel,
--         COUNT(*) AS channel_count
--     FROM accounts a
--         JOIN web_events w ON a.id = w.account_id
--     GROUP BY a.id,
--         a.name,
--         w.channel
-- ),
-- T2 AS (
--     SELECT account_name,
--         MAX(channel_count) as max_channel_count
--     FROM T1
--     GROUP BY account_name
-- )
-- SELECT T2.account_name,
--     T1.channel,
--     T2.max_channel_count
-- FROM T1
--     JOIN T2 ON T1.account_name = T2.account_name
--     AND T1.channel_count = T2.max_channel_count
-- ORDER BY T1.account_id
-- SELECT a.id, a.name, w.channel, COUNT(*) AS channel_count
-- FROM accounts a
-- JOIN web_events w ON a.id = w.account_id
-- GROUP BY a.id, a.name, w.channel
-- SELECT t3.id,
--     t3.name,
--     t3.channel,
--     t3.ct
-- FROM (
--         SELECT a.id,
--             a.name,
--             we.channel,
--             COUNT(*) ct
--         FROM accounts a
--             JOIN web_events we On a.id = we.account_id
--         GROUP BY a.id,
--             a.name,
--             we.channel
--     ) T3
--     JOIN (
--         SELECT t1.id,
--             t1.name,
--             MAX(ct) max_chan
--         FROM (
--                 SELECT a.id,
--                     a.name,
--                     we.channel,
--                     COUNT(*) ct
--                 FROM accounts a
--                     JOIN web_events we ON a.id = we.account_id
--                 GROUP BY a.id,
--                     a.name,
--                     we.channel
--             ) t1
--         GROUP BY t1.id,
--             t1.name
--     ) t2 ON t2.id = t3.id
--     AND t2.max_chan = t3.ct
-- ORDER BY t3.id;
/* Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales. */
-- WITH T1 AS
-- (
--     SELECT r.name region, s.name rep, SUM(o.total_amt_usd) sales
-- FROM region r
--     JOIN sales_reps s ON r.id = s.region_id
--     JOIN accounts a ON s.id = a.sales_rep_id
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY r.name, s.name
-- ), T2 AS
-- (
--     SELECT region, MAX(sales) max_sales
-- FROM T1
-- GROUP BY region
-- )
-- SELECT T2.region, T1.rep, CAST(T2.max_sales AS MONEY) max_sales
-- FROM T1
--     JOIN T2 ON T1.region = T2.region
--     AND T1.sales = T2.max_sales
-- ORDER BY T2.max_sales DESC;
/*For the region with the largest (sum) of sales total_amt_usd,
 how many total (count) orders were placed ?*/
-- WITH T1 AS
-- (SELECT r.name region, SUM(o.total_amt_usd) total_sales, COUNT(*) total_orders
-- FROM region r
--     JOIN sales_reps s ON r.id = s.region_id
--     JOIN accounts a ON s.id = a.sales_rep_id
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY region
-- ORDER BY total_sales DESC
-- LIMIT 1)
-- SELECT T1.region,T1.total_orders
-- FROM T1;
/*How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer ?*/
-- WITH T1 AS
-- (SELECT a.name account_name,
--     SUM(o.total) AS total_purchases,
--     SUM(o.standard_qty) AS total_standard_qty
-- FROM accounts a
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY a.name
-- ORDER BY total_standard_qty DESC
-- LIMIT 1),
-- T2 AS
-- (SELECT a.name account_name,
--     SUM(o.total) AS total_purchases,
--     SUM(o.standard_qty) AS total_standard_qty
-- FROM accounts a
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY a.name
-- ORDER BY total_purchases DESC
-- )
-- SELECT COUNT(*) AS accounts_with_more_purchases_than_max_standard_qty
-- FROM T2
-- WHERE T2.total_purchases > (SELECT T1.total_purchases FROM T1);
/*For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd,
 how many web_events did they have for each channel ?*/
-- WITH T1 AS
-- (SELECT a.name customer, SUM(total_amt_usd) as total_spent
-- FROM accounts a
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY a.name
-- ORDER BY total_spent DESC
-- LIMIT 1
-- ), 
-- T2 AS
-- (SELECT a.name customer, w.channel, COUNT(w.*) as web_events
-- FROM accounts a
--     JOIN web_events w ON a.id = w.account_id
-- GROUP BY a.name, w.channel
-- ORDER BY a.name)
-- SELECT T2.web_events, T2.channel,T1.customer
-- FROM T1
--     JOIN T2 ON T1.customer = T2.customer
-- ORDER BY T2.web_events DESC;
/*What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts ?*/
-- SELECT CAST(AVG(total_spent) AS MONEY) AS "Average Spent for the Top 10 Accounts"
-- FROM
--     (SELECT a.name account_name, SUM(o.total_amt_usd) total_spent
-- FROM accounts a
--     JOIN orders o ON a.id = o.account_id
-- GROUP BY a.name
-- ORDER BY total_spent DESC
-- LIMIT 10) T1;
/*What is the lifetime average amount spent in terms of total_amt_usd,
 including only the companies that spent more per order,
 on average,
 than the average of all orders.*/
SELECT CAST(AVG(avg_amt) AS MONEY)
FROM (
        SELECT o.account_id,
            AVG(o.total_amt_usd) avg_amt
        FROM orders o
        GROUP BY 1
        HAVING AVG(o.total_amt_usd) > (
                SELECT AVG(o.total_amt_usd) avg_all
                FROM orders o
            )
    ) temp_table;