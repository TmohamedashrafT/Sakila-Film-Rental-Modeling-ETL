select 
	rental_id,
	cast(rental_date as DATE) as rental_date_cast,
	CAST(DATEADD(SECOND, -DATEPART(SECOND, rental_date), rental_date) AS TIME) AS rental_time_cast,
	cast(return_date as DATE) as return_date_cast,
	CAST(DATEADD(SECOND, -DATEPART(SECOND, return_date), return_date) AS TIME) AS return_time_cast,
	inventory_id
from rental 
UNION ALL
SELECT null, null, null, null, null, null