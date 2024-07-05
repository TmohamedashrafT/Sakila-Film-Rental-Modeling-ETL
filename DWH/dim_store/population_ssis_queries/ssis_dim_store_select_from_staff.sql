select 
           staff_id,
           first_name as store_manager_first_name,
           last_name as store_manager_last_name

from staff
UNION ALL
SELECT null, null, null