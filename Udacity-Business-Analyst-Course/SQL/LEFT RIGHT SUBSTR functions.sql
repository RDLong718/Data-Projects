/*In the accounts table,
 there is a column holding the website for each company.The last three digits specify what type of web address they are using.A list of extensions (
 and pricing
 ) is provided here.Pull these extensions
 and provide how many of each website type exist in the accounts table.*/
-- SELECT RIGHT(website, 3) AS extension,
--     COUNT(*) AS count
-- FROM accounts
-- GROUP BY extension
-- ORDER BY count DESC;
/*There is much debate about how much the name (
 or even the first letter of a company name
 ) matters.Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (
 or number
 )*/
-- SELECT LEFT(UPPER(name), 1) AS first_letter,
--     COUNT(*) AS count
-- FROM accounts
-- GROUP BY first_letter
-- ORDER BY count DESC;
/*Use the accounts table
 and a CASE
 statement to create two groups: one group of company names that start with a number
 and the second group of those company names that start with a letter.What proportion of company names start with a letter ?*/
-- SELECT SUM(num) AS numbers,
--     SUM(letter) AS letters,
--     SUM(num) / CAST((SUM(num) + SUM(Letter)) AS DECIMAL(5, 2)) AS proportion
-- FROM (
--         SELECT name,
--             CASE
--                 WHEN LEFT(UPPER(name), 1) BETWEEN 'A' AND 'Z' THEN 0
--                 ELSE 1
--             END AS num,
--             CASE
--                 WHEN LEFT(UPPER(name), 1) BETWEEN 'A' AND 'Z' THEN 1
--                 ELSE 0
--             END AS letter
--         FROM accounts
--     ) t1
/*Consider vowels as a,
 e,
 i,
 o,
 and u.What proportion of company names start with a vowel,
 and what percent start with anything
 else ?*/
SELECT SUM(vowel) AS vowels,
    SUM(other) AS other,
    CONCAT(
        ROUND(
            (
                SUM(vowel) * 1.0000 /((SUM(vowel) + SUM(other)) * 1.0000) * 100
            ),
            2
        ),
        '%'
    ) AS proportion_vowels,
    CONCAT(
        ROUND(
            (
                SUM(other) * 1.0000 /((SUM(vowel) + SUM(other)) * 1.000) * 100
            ),
            2
        ),
        '%'
    ) AS proportion_other
FROM(
        SELECT name,
            CASE
                WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 1
                ELSE 0
            END AS vowel,
            CASE
                WHEN LEFT(UPPER(name), 1) NOT IN ('A', 'E', 'I', 'O', 'U') THEN 1
                ELSE 0
            END AS other
        FROM accounts
    ) t1