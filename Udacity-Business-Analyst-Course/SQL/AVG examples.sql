-- SELECT AVG(standard_qty) AS standard_avg,
--     AVG(gloss_qty) AS gloss_avg,
--     AVG(poster_qty) AS poster_avg
-- FROM orders
-- SELECT MIN(occurred_at) AS earliest_order
-- FROM orders
-- SELECT occurred_at AS earliest_order
-- FROM orders
-- Order BY occurred_at ASC
-- LIMIT 1
-- SELECT MAX(occurred_at) AS latest_event
-- FROM web_events
-- SELECT occurred_at AS latest_event
-- FROM web_events
-- ORDER BY occurred_at DESC
-- LIMIT 1
-- SELECT AVG(standard_amt_usd) AS standard_avg,
--     AVG(gloss_amt_usd) AS gloss_avg,
--     AVG(poster_amt_usd) AS poster_avg,
--     AVG(standard_qty) AS standard_qty_avg,
--     AVG(gloss_qty) AS gloss_qty_avg,
--     AVG(poster_qty) AS poster_qty_avg
-- FROM orders
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY total_amt_usd
    ) AS median_total
FROM orders