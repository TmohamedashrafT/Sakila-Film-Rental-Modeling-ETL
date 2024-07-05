select 
	film_id as film_id,
	title as film_title,
	release_year as film_release_year,
	rental_duration as film_rental_duration,
	rental_rate as film_rental_rate,
	length as film_length,
	replacement_cost as film_replacement_cost,
	rating as film_rating,
	special_features as  film_special_features,
	language_id as film_language_id,
	last_update as film_last_update
from film
where last_update > ?
