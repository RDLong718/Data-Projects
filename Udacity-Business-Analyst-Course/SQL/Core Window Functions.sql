/*Create a running total of standard_amt_usd (in the orders table) over order time with no date truncation.Your final table should have two columns: one with the amount being added for each new row,
 and a second with the running total.*/
-- SELECT occurred_at,standard_amt_usd, SUM(standard_amt_usd) OVER
-- (ORDER BY occurred_at) AS running_total
-- FROM orders
/*Now,
 modify your query
 from the previous quiz to include partitions.Still create a running total of standard_amt_usd (in the orders table) over order time,
 but this time,
 date truncate occurred_at by year
 and partition by that same year - truncated occurred_at variable.*/
-- SELECT standard_amt_usd, DATE_TRUNC('year',occurred_at) AS month, SUM(standard_amt_usd) OVER
-- (PARTITION BY DATE_TRUNC('year', occurred_at)ORDER BY occurred_at) AS running_total
-- FROM orders
/*Practice*/
-- SELECT id,
--     account_id,
--     standard_qty,
--     DATE_TRUNC('month', occurred_at) AS month,
--     DENSE_RANK() OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS dense_rank,
--     SUM(standard_qty) OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS sum_standard_qty,
--     COUNT(standard_qty) OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS count_standard_qty,
--     AVG(standard_qty) OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS avg_standard_qty,
--     MIN(standard_qty) OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS min_standard_qty,
--     MAX(standard_qty) OVER (
--         PARTITION BY account_id
--         ORDER BY DATE_TRUNC('month', occurred_at)
--     ) AS max_standard_qty
-- FROM orders
/*Compare to Previous*/
SELECT id,
    account_id,
    standard_qty,
    DATE_TRUNC('month', occurred_at) AS month,
    DENSE_RANK() OVER (PARTITION BY account_id) AS dense_rank,
    SUM(standard_qty) OVER (PARTITION BY account_id) AS sum_std_qty,
    COUNT(standard_qty) OVER (PARTITION BY account_id) AS count_std_qty,
    AVG(standard_qty) OVER (PARTITION BY account_id) AS avg_std_qty,
    MIN(standard_qty) OVER (PARTITION BY account_id) AS min_std_qty,
    MAX(standard_qty) OVER (PARTITION BY account_id) AS max_std_qty
FROM orders