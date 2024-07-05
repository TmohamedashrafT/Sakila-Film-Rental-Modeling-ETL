select film_rental_rate_per_day,
	   count(rental_id) as number_of_rentals

from fact_rental fr
inner join dim_film df
on fr.film_key = df.film_key
group by film_rental_rate_per_day
