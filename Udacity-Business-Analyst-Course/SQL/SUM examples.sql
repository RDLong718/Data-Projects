-- SELECT SUM(standard_qty) AS standard,
-- SUM(gloss_qty) AS glossy,
-- SUM(poster_qty) AS poster
-- FROM orders
-- SELECT SUM(poster_qty) AS poster
-- FROM orders
-- SELECT SUM(standard_qty) AS standard
-- FROM orders
-- SELECT SUM(total_amt_usd) AS total
-- FROM orders
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
From orders -- SELECT CAST((SUM(standard_amt_usd)/SUM(standard_qty)) AS money) AS standard
    -- FROM orders