-- SELECT BillingCountry, COUNT(*) AS invoices
-- FROM invoice
-- GROUP BY BillingCountry
-- ORDER BY invoices DESC
-- SELECT BillingCity, SUM(total) AS total
-- FROM Invoice
-- GROUP BY BillingCity
-- ORDER BY total DESC
-- SELECT c.customerid, c.firstname, c.lastname, SUM(i.total) AS total
-- FROM customer c
--     JOIN invoice i ON c.customerid = i.customerid
-- GROUP BY c.customerid, c.firstname, c.lastname
-- ORDER BY total DESC
-- LIMIT 1
/*Use your query to return the email,
 first name,
 last name,
 and Genre of all Rock Music listeners (
 Rock & Roll would be considered a different category for this exercise
 ).Return your list ordered alphabetically by email address starting with A.*/
-- SELECT c.email,
--     c.firstname,
--     c.lastname,
--     g.name
-- FROM customer c
--     JOIN invoice i ON c.customerid = i.customerid
--     JOIN invoiceline il ON i.invoiceid = il.invoiceid
--     JOIN track t ON il.trackid = t.trackid
--     JOIN genre g ON t.genreid = g.genreid
-- WHERE g.name = 'Rock'
-- ORDER BY c.email ASC
/*Now that we know that our customers love rock music,
 we can decide which musicians to invite to play at the concert.Let 's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands.
 
 You will need to use the Genre, Track , Album, and Artist tables.*/
SELECT a.name,
    COUNT(t.trackid) AS total_tracks
FROM artist a
    JOIN album al ON a.artistid = al.artistid
    JOIN track t ON al.albumid = t.albumid
    JOIN genre g ON t.genreid = g.genreid
WHERE g.name = 'Rock'
GROUP BY a.name
ORDER BY total_tracks DESC
LIMIT 10