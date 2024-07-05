select 
	ad.address_id as customer_address_id,
	ad.address as customer_address,
	ad.city_id as customer_city_id,
	ci.city as customer_city,
	ci.country_id as customer_country_id,
	co.country as customer_country,
	ad.last_update as customer_address_last_update

from address ad
left join city ci
on ad.city_id = ci.city_id

left join country co
on ci.country_id = co.country_id

UNION ALL
SELECT null, null, null, null, null, null, null