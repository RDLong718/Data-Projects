WITH table AS(
    SELECT student_information,
        value,
        ROW _NUMBER() OVER(
            PARTITION BY student_information
            ORDER BY (
                    SELECT NULL
                )
        ) AS row_number
    FROM student_db
        CROSS APPLY STRING_SPLIT(student_information, ',') AS back_values
)
SELECT student_information,
    [1] AS STUDENT_ID,
    [2] AS GENDER,
    [3] AS CITY,
    [4] AS GPA,
    [5] AS SALARY
FROM table PIVOT(
        MAX(VALUE) FOR row_number IN([1], [2], [3], [4], [5])
    ) AS PVT
)