WITH time_cte AS (
    SELECT CAST('00:00:00' AS TIME) AS full_time
    UNION ALL
    SELECT DATEADD(MINUTE, 1, full_time)
    FROM time_cte
    WHERE full_time < '23:59:00'
)
INSERT INTO dim_time
SELECT 
    full_time,
    DATEPART(HOUR, full_time) AS hour,
    DATEPART(MINUTE, full_time) AS minute
FROM time_cte
OPTION (MAXRECURSION 0);

