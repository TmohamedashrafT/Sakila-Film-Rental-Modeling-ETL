select 
	customer_id,
	staff_id,
	rental_id,
	amount,
	cast(payment_date as DATE) as payment_date_cast,
	CAST(DATEADD(SECOND, -DATEPART(SECOND, payment_date), payment_date) AS TIME) AS payment_time_cast,
	last_update
from payment
where last_update > ?