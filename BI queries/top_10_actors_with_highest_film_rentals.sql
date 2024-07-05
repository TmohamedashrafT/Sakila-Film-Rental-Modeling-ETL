select TOP 10 da.actor_full_name, COUNT(rental_id) as num_of_rentals

from fact_rental fr
inner join film_to_actor_bridge fa
on fr.film_key = fa.film_key
inner join dim_actor da
on da.actor_key = fa.actor_key
group by da.actor_full_name
order by COUNT(rental_id) DESC;
