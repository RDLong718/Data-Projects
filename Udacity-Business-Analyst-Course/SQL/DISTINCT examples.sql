-- SELECT a.id as "account id",
--     r.id as "region id",
--     a.name as "account name",
--     r.name as "region name"
-- FROM accounts a
--     JOIN sales_reps s ON s.id = a.sales_rep_id
--     JOIN region r ON r.id = s.region_id;
-- SELECT DISTINCT id,
--     name
-- FROM accounts;
SELECT s.id,
    s.name,
    COUNT(*) num_accounts
FROM accounts a
    JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.id,
    s.name
ORDER BY num_accounts;
-- SELECT DISTINCT id,
--     name
-- FROM sales_reps;