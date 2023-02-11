/*Use the accounts table to create first
 and last name columns that hold the first
 and last names for the primary_poc.*/
-- SELECT primary_poc,
--     LEFT(primary_poc,POSITION(' ' in primary_poc))AS first_name,
--     SUBSTRING(primary_poc, POSITION(' ' in primary_poc)) AS last_name
-- FROM accounts a
-- ORDER BY primary_poc 
/*Now see if you can do the same thing for every rep name in the sales_reps table.Again provide first
 and last name columns.*/
-- SELECT name,
--     LEFT(name,POSITION(' ' in name))AS first_name,
--     SUBSTRING(name, POSITION(' ' in name)) AS last_name
-- FROM sales_reps s
/*Each company in the accounts table wants to create an email address for each primary_poc.The email address should be the first name of the primary_poc.last name primary_poc @ company name.com.*/
-- WITH T1 AS
-- (SELECT primary_poc, 
-- LEFT(primary_poc,POSITION(' ' in primary_poc))AS first_name,
-- SUBSTRING(primary_poc, POSITION(' ' in primary_poc)) AS last_name,
-- '@'||regexp_replace(name, '[^\w]+', '', 'g')||'.com' AS email
-- FROM accounts a)
-- SELECT REPLACE(CONCAT(first_name,'.', last_name, email),' ','') AS email
-- FROM T1
-- ORDER BY email
-- SELECT regexp_replace(name, '[^\w]+', '','g')AS NAME
-- FROM accounts
-- ORDER BY NAME
/*We would also like to create an initial password,
 which they will change
 after their first log in.The first password will be the first letter of the primary_poc 's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.*/
WITH T1 AS (
    SELECT REPLACE(
            LEFT(LOWER(primary_poc), POSITION(' ' in primary_poc)),
            ' ',
            ''
        ) AS first_name,
        REPLACE(
            SUBSTRING(LOWER(primary_poc), POSITION(' ' in primary_poc)),
            ' ',
            ''
        ) AS last_name,
        REPLACE(UPPER(name), ' ', '') AS company_name
    FROM accounts a
)
SELECT CONCAT(
        LEFT(first_name, 1),
        RIGHT(first_name, 1),
        LEFT(last_name, 1),
        RIGHT(last_name, 1),
        LENGTH(first_name),
        LENGTH(last_name),
        company_name
    ) AS password
FROM T1
ORDER BY password