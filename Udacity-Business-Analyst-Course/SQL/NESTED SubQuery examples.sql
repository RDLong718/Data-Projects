/*The average amount of standard paper sold on the first month that any order was placed in the orders table (in terms of quantity).*/
-- SELECT AVG(standard_qty) AS avg_standard_qty
-- FROM orders
-- WHERE DATE_TRUNC('month', occurred_at) = (
--         SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
--         FROM orders
--     )
--     AND DATE_TRUNC('year', occurred_at) = (
--     SELECT DATE_TRUNC('year', MIN(occurred_at)) AS year
--     FROM orders
--     )
/*The average amount of gloss paper sold on the first month that any order was placed in the orders table (in terms of quantity).*/
-- SELECT ROUND(AVG(gloss_qty),2) AS avg_gloss_qty
-- FROM orders
-- WHERE DATE_TRUNC('month', occurred_at) = (
--         SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
--         FROM orders
--     )
--     AND DATE_TRUNC('year', occurred_at) = (
--         SELECT DATE_TRUNC('year', MIN(occurred_at)) AS year
--         FROM orders
--     )
/*The average amount of poster paper sold on the first month that any order was placed in the orders table (in terms of quantity).*/
-- SELECT ROUND(AVG(poster_qty), 2) AS avg_poster_qty
-- FROM orders
-- WHERE DATE_TRUNC('month', occurred_at) = (
--         SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
--         FROM orders
--     )
--     AND DATE_TRUNC('year', occurred_at) = (
--         SELECT DATE_TRUNC('year', MIN(occurred_at)) AS year
--         FROM orders
--     )
/*The total amount spent on all orders on the first month that any order was placed in the orders table (in terms of usd).*/
SELECT ROUND(SUM(total_amt_usd), 2) AS total_spent
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (
        SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
        FROM orders
    )
    AND DATE_TRUNC('year', occurred_at) = (
        SELECT DATE_TRUNC('year', MIN(occurred_at)) AS year
        FROM orders
    )