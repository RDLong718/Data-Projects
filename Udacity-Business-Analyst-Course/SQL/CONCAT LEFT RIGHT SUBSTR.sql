/*Suppose the company wants to assess the performance of all the sales representatives.Each sales representative is assigned to work in a particular region.To make it easier to understand for the HR team,
 display the concatenated sales_reps.id,
 ‘ _ ’ (underscore),
 and region.name as EMP_ID_REGION for each sales representative.*/
-- SELECT CONCAT(s.id, '_', r.name) AS EMP_ID_REGION,
--     s.name AS EMP_NAME
-- FROM sales_reps s
--     JOIN region r ON s.region_id = r.id
-- ORDER BY EMP_ID_REGION
/*From the accounts table,
 display the name of the client,
 the coordinate as concatenated (latitude, longitude),
 email id of the primary point of contact as < first letter of the primary_poc > < last letter of the primary_poc > @ < extracted name
 and domain
 from the website >.*/
-- SELECT a.name AS CLIENT_NAME,
--     CONCAT(a.lat, ',', a.long) AS coordinates,
--     CONCAT(
--         LEFT(a.primary_poc, 1),
--         RIGHT(a.primary_poc, 1),
--         '@',
--         SUBSTR(a.website, 5)
--     ) AS email_id
-- FROM accounts a
-- ORDER BY CLIENT_NAME;
/*From the web_events table,
 display the concatenated value of account_id,
 '_',
 channel,
 '_',
 count of web events of the particular channel.*/
SELECT CONCAT(w.account_id, '_', w.channel, '_', COUNT(w.channel))
FROM web_events w
GROUP BY w.account_id,
    w.channel
ORDER BY w.account_id,
    w.channel;