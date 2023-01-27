-- SELECT occurred_at, SUM(standard_qty) AS qty
-- FROM orders
-- GROUP BY occurred_at
-- ORDER BY occurred_at;
-- SELECT DATE_PART('dow', occurred_at) AS day_of_week,
-- account_id,
-- occurred_at,
-- total
-- FROM orders
-- SELECT DATE_PART('dow', occurred_at) AS day_of_week, SUM(total) AS total_qty
-- FROM orders
-- GROUP BY day_of_week
-- ORDER BY total_qty
-- SELECT to_char(occurred_at, 'DAY') AS day_of_week,
--     SUM(total) AS total_qty
-- FROM orders
-- GROUP BY day_of_week
-- ORDER BY total_qty
/*
 Find the sales in terms of total dollars for all orders in each year,
 ordered
 from greatest to least.Do you notice any trends in the yearly sales totals ?
 */
--  SELECT DATE_PART('year', occurred_at) AS year, CAST(SUM(total_amt_usd) AS money) AS total_sales
--     FROM orders
--     GROUP BY year
--     ORDER BY total_sales DESC
/*
 Which month did Parch & Posey have the greatest sales in terms of total dollars ? Are all months evenly represented by the dataset ?
 */
--  SELECT DATE_PART('month',occurred_at) AS "Month", CAST(SUM(total_amt_usd) AS money) AS "Total Sales"
--     FROM orders
--     GROUP BY 1
--     ORDER BY 2 DESC
--     SELECT TO_CHAR(occurred_at, 'Month') AS "Month",
--     CAST(SUM(total_amt_usd) AS money) AS "Total Sales"
-- FROM orders
-- WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
-- GROUP BY 1
-- ORDER BY 2 DESC
/*Which year did Parch & Posey have the greatest sales in terms of the total number of orders ? Are all years evenly represented by the dataset ?   */
-- SELECT DATE_PART('year', occurred_at) AS year, COUNT(total) AS total_orders
-- FROM orders
-- GROUP BY year
-- ORDER BY total_orders DESC
/*Which month did Parch & Posey have the greatest sales in terms of the total number of orders ? Are all months evenly represented by the dataset ?*/
-- SELECT DATE_PART('month', occurred_at) AS month, COUNT(total) AS total_orders
-- FROM orders
-- GROUP BY month
-- ORDER BY total_orders DESC
/*In which month of which year did Walmart spend the most on gloss paper in terms of dollars ?*/
-- SELECT DATE_PART('month', occurred_at) AS month, DATE_PART('year',occurred_at) AS year, CAST(SUM(gloss_amt_usd) AS money) AS total_glossy_sales
-- FROM orders
-- JOIN accounts ON orders.account_id = accounts.id
-- WHERE accounts.name = 'Walmart'
-- GROUP BY month, year
-- ORDER BY total_glossy_sales DESC
-- LIMIT 1
SELECT DATE_TRUNC('month', occurred_at) AS month,
    CAST(SUM(gloss_amt_usd) AS money) AS total_glossy_sales
FROM orders
    JOIN accounts ON orders.account_id = accounts.id
WHERE accounts.name = 'Walmart'
GROUP BY month
ORDER BY total_glossy_sales DESC
LIMIT 1