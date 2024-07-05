select 
     staff_id,
     first_name as staff_first_name,
     last_name as staff_last_name,
	 address_id as staff_address_id,
	 email as staff_email,
	 active as staff_active,
     last_update as staff_last_update

from staff
where last_update > ?