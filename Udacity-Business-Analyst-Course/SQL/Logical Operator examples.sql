-- SELECT *
-- FROM accounts
-- WHERE website LIKE '%google.com%';
-- SELECT *
-- from accounts
-- WHERE name LIKE 'C%'
-- ORDER BY name ASC;
-- SELECT *
-- from accounts
-- WHERE name LIKE '%one%'
-- ORDER BY name ASC;
-- SELECT *
-- from accounts
-- WHERE name LIKE '%s'
-- ORDER BY name ASC;
-- SELECT *
-- FROM orders
-- WHERE account_id IN (1001,1021)
-- SELECT name, primary_poc, sales_rep_id
-- FROM accounts
-- WHERE name IN ('Walmart', 'Target', 'Nordstrom')
-- SELECT *
-- FROM web_events
-- WHERE channel IN ('organic', 'adwords')
-- SELECT sales_rep_id, name
-- FROM accounts
-- WHERE sales_rep_id NOT IN(321500,321570)
-- ORDER BY sales_rep_id 
-- SELECT * FROM accounts
-- WHERE website NOT LIKE '%com%'
-- SELECT name, primary_poc, sales_rep_id
-- FROM accounts
-- WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')
-- SELECT *
-- FROM web_events
-- WHERE channel NOT IN ('organic', 'adwords')
-- SELECT *
-- FROM accounts
-- WHERE name NOT LIKE 'C%'
-- ORDER BY name ASC;
-- SELECT *
-- FROM accounts
-- WHERE name NOT LIKE '%one%'
-- SELECT *
-- FROM accounts
-- WHERE name NOT LIKE '%s'
-- SELECT *
-- FROM orders
-- WHERE occurred_at BETWEEN '2016-04-01' AND '2016-10-01'
-- ORDER BY occurred_at DESC
-- SELECT *
-- FROM orders
-- WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0
-- SELECT name
-- FROM accounts
-- WHERE name NOT LIKE 'C%' AND name LIKE '%s'
-- ORDER BY name ASC;
-- SELECT occurred_at, gloss_qty
-- FROM orders
-- WHERE gloss_qty BETWEEN 24 AND 29
-- ORDER BY gloss_qty ASC
-- SELECT *
-- FROM web_events
-- WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
-- ORDER BY occurred_at DESC
-- SELECT account_id, occurred_at,standard_qty, gloss_qty, poster_qty
-- FROM orders
-- WHERE standard_qty =0 OR gloss_qty = 0 OR poster_qty = 0
-- SELECT account_id,
--     occurred_at,
--     standard_qty,
--     gloss_qty,
--     poster_qty
-- FROM orders
-- WHERE (standard_qty = 0
--     OR gloss_qty = 0
--     OR poster_qty = 0)
--     AND occurred_at >= '2016-10-01'
--     ORDER BY occurred_at 
-- SELECT id FROM orders
-- WHERE gloss_qty > 4000 OR poster_qty > 4000
-- SELECT *
-- FROM orders
-- WHERE standard_qty = 0 AND (gloss_qty > 100 OR poster_qty > 100)
SELECT name,
    primary_poc
FROM accounts
WHERE (
        name LIKE 'C%'
        OR name LIKE 'W%'
    )
    AND (
        primary_poc LIKE '%ana%'
        OR primary_poc LIKE '%Ana%'
    )
    AND (primary_poc NOT LIKE '$eana$')