SELECT 
    d.month_name,
    d.year,
    COUNT(fr.rental_id) AS rental_count
FROM 
    fact_rental fr
JOIN 
    dim_date d ON fr.rental_date = d.date_key
GROUP BY 
    d.year, d.month_of_year, d.month_name
ORDER BY 
    d.year, d.month_of_year;
