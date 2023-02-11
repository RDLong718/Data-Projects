/*Consider the same Parch & Posey database schema again,
 where the sales_reps table contains details about sales representatives
 and the region table contains the list of regions.*/
-- CREATE VIEW v1
-- AS
-- SELECT s.id, s.name as Rep_Name, R.name as Region_Name
-- FROM sales_reps s
-- JOIN region R ON s.region_id = R.id
-- AND R.name = 'Northeast'
/*Provide the name for each region for every order,
 as well as the account name
 and the unit price they paid (total_amt_usd / total) for the order.Your final result should have 3 columns: region name,
 account name,
 and unit price.*/
-- CREATE VIEW v2
-- AS
-- SELECT r.name Region_Name, a.name Account_Name, CAST((o.total_amt_usd / (o.total + .0001))AS MONEY) Unit_Price
-- FROM orders o
-- JOIN accounts a ON o.account_id = a.id
-- JOIN sales_reps s ON a.sales_rep_id = s.id
-- JOIN region r ON s.region_id = r.id
/*Show the report which channels send the most traffic per day on average to Parch
 and Posey.*/
-- CREATE VIEW v3 
-- AS
-- SELECT channel, AVG(events) AS avg_events_per_day
-- FROM(
-- SELECT DATE_TRUNC('day', occurred_at) AS Day, channel, COUNT(*) AS events
-- FROM web_events
-- GROUP BY 1, 2) sub 
-- GROUP BY 1
SELECT MAX(avg_events_per_day) AS max_avg_events_per_day
FROM v3