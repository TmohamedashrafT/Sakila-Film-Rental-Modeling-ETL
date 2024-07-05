select 
           store_id as store_id,
           manager_staff_id as manager_staff_id ,
           address_id as store_address_id,
           last_update as store_last_update
from store
where 
last_update > ?