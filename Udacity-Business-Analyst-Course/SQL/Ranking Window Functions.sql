-- SELECT DENSE_RANK() OVER(ORDER BY o.total_amt_usd DESC) AS rank,
-- a.name AS account_name, o.total_amt_usd
-- FROM orders o
-- JOIN accounts a ON a.id = o.account_id
-- ORDER BY o.total_amt_usd DESC;
/*Select the id,
 account_id,
 and total variable
 from the orders table,
 then create a column called total_rank that ranks this total amount of paper ordered (
 from highest to lowest
 ) for each account using a partition.Your final table should have these four columns.*/
SELECT id,
    account_id,
    total,
    RANK() OVER (
        PARTITION BY account_id
        ORDER BY total DESC
    ) AS total_rank
FROM orders