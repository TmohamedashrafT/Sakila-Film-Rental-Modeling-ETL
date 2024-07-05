SELECT df.film_rating, round((COUNT(fr.rental_id) * 100.0 / (SELECT COUNT(rental_id) FROM fact_rental)),2) AS the_ratio
FROM fact_rental fr
INNER JOIN dim_film df ON fr.film_key = df.film_key
GROUP BY df.film_rating;
