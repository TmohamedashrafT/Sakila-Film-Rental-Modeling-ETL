select 
	inventory_id,
	store_id,
	film_id
from inventory
UNION ALL
SELECT null, null, null