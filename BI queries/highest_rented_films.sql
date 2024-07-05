select top 10 df.film_title, 
	   count(fr.rental_id) as number_of_rentals
from fact_rental fr
inner join dim_film df
on fr.film_key = df.film_key
group by df.film_title
order by count(fr.rental_id) DESC;