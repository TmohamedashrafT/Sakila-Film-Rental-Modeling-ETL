DECLARE @prefix NVARCHAR(50) = 'film_category_'
DECLARE @table NVARCHAR(50) = 'dim_film'
DECLARE @columns NVARCHAR(MAX) = ''
DECLARE @countColumns NVARCHAR(MAX) = ''

-- Construct the dynamic SQL to select columns with the given prefix
SELECT @columns = STRING_AGG(COLUMN_NAME, ', ')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @table
AND COLUMN_NAME LIKE @prefix + '%'

-- Create a string for counting each column if it contains 'yes'
SELECT @countColumns = STRING_AGG('SELECT ''' + COLUMN_NAME + ''' AS column_name, COUNT(CASE WHEN ' + COLUMN_NAME + ' = ''yes'' THEN 1 END) AS count_yes FROM fact_rental fr JOIN dim_film df ON fr.film_key = df.film_key', ' UNION ALL ')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @table
AND COLUMN_NAME LIKE @prefix + '%'
EXEC sp_executesql @countColumns
