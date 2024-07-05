select 
	film_id,
	actor_id,
	last_update 
from film_actor
where last_update > ?
