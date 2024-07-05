select ds.staff_first_name,
	   dt.store_country,
	   count(rental_id) as number_of_rentals
	
from fact_rental fr
inner join dim_staff ds
on fr.staff_key = ds.staff_key
inner join dim_store dt
on fr.store_key = dt.store_key
group by ds.staff_first_name, dt.store_country
