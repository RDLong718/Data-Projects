-- SELECT account_id,
--     SUM(total_amt_usd) AS sum_total_amt_usd
-- FROM orders
-- GROUP BY 1
-- HAVING SUM(total_amt_usd) >= 250000
-- SELECT s.id AS sales_rep , s.name AS sales_rep_name, COUNT(*)
-- FROM accounts a
--     JOIN sales_reps s 
--     ON s.id = a.sales_rep_id
-- GROUP BY 1,2
-- HAVING COUNT(*) > 5
-- ORDER BY 3 DESC;
-- SELECT a.id AS account_id, a.name AS account_name, COUNT(*)
-- FROM accounts a
--     JOIN orders o
--     ON o.account_id = a.id
-- GROUP BY 1,2
-- HAVING COUNT(*) > 20
-- ORDER BY 3 DESC;
SELECT a.id AS account_id,
    a.name AS account_name,
    COUNT(*)
FROM accounts a
    JOIN orders o ON o.account_id = a.id
GROUP BY 1,
    2
ORDER BY 3 DESC
LIMit 1