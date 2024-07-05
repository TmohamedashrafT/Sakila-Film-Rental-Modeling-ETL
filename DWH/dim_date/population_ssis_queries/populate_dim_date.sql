WITH date_cte AS (
    SELECT CAST('2005-01-01' AS DATE) AS date
    UNION ALL
    SELECT DATEADD(day, 1, date)
    FROM date_cte
    WHERE date < '2030-12-31'
)
INSERT INTO dim_date
SELECT 
    date,
    DATEPART(WEEKDAY, date) AS day_of_week,
    DATENAME(WEEKDAY, date) AS day_name,
    DATEPART(DAY, date) AS day_of_month,
    DATEPART(DAYOFYEAR, date) AS day_of_year,
    DATEPART(WEEK, date) AS week_of_year,
    DATENAME(MONTH, date) AS month_name,
    DATEPART(MONTH, date) AS month_of_year,
    DATEPART(QUARTER, date) AS quarter,
    DATEPART(YEAR, date) AS year
FROM date_cte
OPTION (MAXRECURSION 0);
