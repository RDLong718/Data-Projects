-- SELECT COUNT(*) AS order_count
-- FROM orders
-- WHERE occurred_at >= '2016-12-01'
-- AND occurred_at < '2017-01-01'
-- SELECT COUNT(*) AS accounts_count
-- FROM accounts
-- SELECT COUNT(accounts.id)
-- FROM accounts
-- SELECT COUNT(id) AS account_primary_poc_count
-- FROM accounts
-- WHERE primary_poc IS NULL
SELECT COUNT(id) AS account_primary_poc_count
FROM accounts
WHERE primary_poc IS NOT NULL