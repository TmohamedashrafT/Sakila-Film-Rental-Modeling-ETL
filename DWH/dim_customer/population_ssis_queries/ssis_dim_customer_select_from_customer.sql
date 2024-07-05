select 
		cu.customer_id as customer_id,
		cu.first_name as customer_first_name,
		cu.last_name as customer_last_name,
		cu.email as customer_email,
		cu.active as customer_active,
		cu.address_id as customer_address_id,
		cu.create_date as customer_create_date,
		cu.last_update as customer_last_update
from customer cu
where (cu.last_update > ? or cu.create_date > ? ) 
and 
cu.last_update < ? 
and 
cu.create_date < ?