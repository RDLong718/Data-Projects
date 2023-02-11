/*What is the average length of a track by genre? Convert from milliseconds to minutes. */
-- SELECT g.name,
--     ROUND(((AVG(t.milliseconds) / 1000) / 60), 2) AS "Average in Minutes"
-- FROM track t
--     JOIN genre g ON t.genreid = g.genreid
-- GROUP BY g.name
-- HAVING AVG(t.milliseconds) < (
--         SELECT AVG(milliseconds)
--         FROM track
--     )
-- ORDER BY g.name
/*What are the top albums purchased from each country?*/
WITH t1 AS (
    SELECT c.country,
        ar.name,
        a.title,
        COUNT(il.invoiceid) AS total
    FROM customer c
        JOIN invoice i ON c.customerid = i.customerid
        JOIN invoiceline il ON i.invoiceid = il.invoiceid
        JOIN track t ON il.trackid = t.trackid
        JOIN album a ON t.albumid = a.albumid
        JOIN artist ar ON a.artistid = ar.artistid
    GROUP BY c.country,
        ar.name,
        a.title
    ORDER BY total DESC
)
SELECT country AS "Country",
    title AS "Album Title",
    MAX(total) AS "Number Sold"
FROM t1
GROUP BY country
ORDER BY 3 DESC
    /*What are the top 10 spending cities*/
    -- SELECT c.city,
    --     ROUND(SUM(i.total), 2) AS "Total Spent"
    -- FROM customer c
    --     JOIN invoice i ON c.customerid = i.customerid
    -- GROUP BY c.city
    -- ORDER BY 2 DESC
    -- LIMIT 10
    /*What are the top Genres*/
    -- SELECT g.name,
    --     COUNT(il.invoiceid) AS "Number Sold"
    -- FROM genre g
    --     JOIN track t ON g.genreid = t.genreid
    --     JOIN invoiceline il ON t.trackid = il.trackid
    -- GROUP BY g.name
    -- ORDER BY 2 DESC
    -- LIMIT 10