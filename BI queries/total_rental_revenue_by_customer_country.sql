SELECT 
    c.customer_country,
    SUM(r.amount) AS total_revenue
FROM 
    fact_rental r
JOIN 
    dim_customer c ON r.customer_key = c.customer_key
GROUP BY 
    c.customer_country
ORDER BY 
    total_revenue DESC;
