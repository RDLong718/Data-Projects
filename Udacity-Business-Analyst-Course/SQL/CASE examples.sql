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
-- SELECT account_id,
--     total_amt_usd,
--     CASE
--         WHEN total_amt_usd >= 3000 THEN 'Large'
--         ELSE 'Small'
--     END AS order_level
-- FROM orders
-- ORDER BY total_amt_usd DESC;
/*Write a query to display the number of orders in each of three categories,
 based on the total number of items in each order.The three categories are: 'At Least 2000',
 'Between 1000 and 2000'
 and 'Less than 1000'.*/
-- SELECT COUNT(*),
-- CASE
-- WHEN total >= 2000 THEN 'At Least 2000'
-- WHEN total >=1000 AND total  <2000 THEN 'Between 1000 and 2000'
-- ELSE 'Less than 1000'
-- END AS total_category
-- FROM orders
-- GROUP BY total_category
-- ORDER BY total_category DESC;
/* We would like to understand 3 different levels of customers based on the amount 
 associated with their purchases.The top - level includes anyone with a Lifetime Value 
 (total sales of all orders) greater than 200,000 usd.The second level is between 
 200,000 and 100,000 usd.The lowest level is anyone under 100,000 usd.Provide a table that includes the level associated with each account.You should provide the account name, the total sales of all orders for the customer, and the level.Order with the top spending customers listed first.*/
-- SELECT a.name, SUM(o.total_amt_usd) AS total_sales,
-- CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Level'
-- WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN 'Second Level'
-- ELSE 'Lowest Level'
-- END AS customer_level
-- FROM orders o
-- JOIN accounts a ON a.id = o.account_id
-- GROUP BY a.name
-- ORDER BY total_sales DESC;
/*We would now like to perform a similar calculation to the first,
 but we want to obtain the total amount spent by customers only in 2016
 and 2017.Keep the same levels as in the previous question.Order with the top spending customers listed first.*/
-- SELECT a.name, SUM(o.total_amt_usd) AS total_sales,
-- CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Level'
-- WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN 'Middle Level'
-- ELSE 'Lowest Level'
-- END AS customer_level
-- FROM orders o
-- JOIN accounts a ON a.id = o.account_id
-- WHERE DATE_PART('year', o.occurred_at) IN (2016, 2017)
-- GROUP BY a.name
-- ORDER BY total_sales DESC;
/*We would like to identify top - performing sales reps,
 which are sales reps associated with more than 200 orders.Create a table with the sales rep name,
 the total number of orders,
 and a column with top
 or not depending on if they have more than 200 orders.Place the top salespeople first in your final table.*/
-- SELECT s.name sales_rep_name, COUNT(o.id) AS total_orders,
-- CASE WHEN COUNT(o.id) > 200 THEN 'TOP'
-- ELSE 'NOT'
-- END AS top_or_not
-- FROM orders o
-- JOIN accounts a 
-- ON a.id = o.account_id
-- JOIN sales_reps s
-- ON s.id = a.sales_rep_id
-- GROUP BY s.name
-- ORDER BY total_orders DESC;
/*The previous didn 't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top-performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on these criteria. Place the top salespeople based on the dollar amount of sales first in your final table. You might see a few upset salespeople by this criteria!*/
SELECT s.name sales_rep_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amt_usd)::MONEY AS total_sales,
    CASE
        WHEN COUNT(o.id) > 200
        OR SUM(o.total_amt_usd) > 750000 THEN 'TOP'
        WHEN COUNT(o.id) > 150
        OR SUM(o.total_amt_usd) > 500000 THEN 'MIDDLE'
        ELSE 'LOW'
    END AS LEVEL
FROM orders o
    JOIN accounts a ON a.id = o.account_id
    JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY total_sales DESC;