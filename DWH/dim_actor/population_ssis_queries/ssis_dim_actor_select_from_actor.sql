select 
     actor_id,
     first_name as actor_first_name,
     last_name as actor_last_name,
     last_update as actor_last_update
from actor
where last_update > ?